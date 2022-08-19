const { Op } = require("sequelize");

const db = require("../models");

const fs = require("fs");

const padStart = require("../helper/padStart");
const { generateSLA } = require("../helper/sla");
const generateReportPDF = require("../helper/generateReportPdf");
const notificationController = require("./notification-controllers");

const Email = require("../services/email");
const EmailService = new Email();

const getAllTickets = async (req, res) => {
	const limit = +req.query.limit || 10;
	const page = +req.query.page || 1;

	const { sortBy, sortOrder, filter } = req.query;

	let filterParse;
	let where = {};
	// Filtering algorithm
	if (filter) {
		filterParse = JSON.parse(filter);
		// where = {};
		if (filterParse.product) {
			where.product = parseInt(filterParse.product);
		}
		if (filterParse.status) {
			where.status = filterParse.status;
		}
		if (filterParse.subject) {
			where.casesubject = filterParse.subject;
		}
		if (filterParse.severity) {
			where["$CaseSubject.severity$"] = filterParse.severity;
		}
		if (filterParse.sla) {
			if (filterParse.sla === "OVERDUE") {
				where.sla = { [Op.lt]: 0 };
			} else {
				where.sla = { [Op.lte]: parseInt(filterParse.sla) };
			}
		}
	}

	// Sorting algorithm
	let order;
	if (sortBy === "severity") {
		order = ["CaseSubject", "severity"];
	} else if (sortBy === "created_by") {
		order = [{ model: db.User, as: "createdBy" }, "name"];
	} else if (sortBy === "pic") {
		order = [{ model: db.User, as: "pic" }, "name"];
	} else if (sortBy === "subject") {
		order = ["CaseSubject", "subject"];
	} else if (sortBy === "product") {
		order = ["Product", "product_name"];
	}

	try {
		const { count, rows: tickets } = await db.Ticket.findAndCountAll({
			include: [
				{ model: db.Product, attributes: ["product_name"] },
				{ model: db.CaseSubject, attributes: ["subject", "severity"] },
				{ model: db.User, attributes: ["name"], as: "pic" },
				{ model: db.User, attributes: ["name"], as: "createdBy" },
			],
			where: {
				[Op.and]: [
					where,
					{
						[Op.or]: [
							{
								assigned_to:
									req.userData.role !== "Administrator" &&
									req.userData.role.split("_")[0],
							},
							{
								created_by_dept:
									req.userData.role !== "Administrator" &&
									req.userData.role.split("_")[0],
							},
						],
					},
				],
			},
			limit,
			order: order
				? [[...order, sortOrder || "asc"]]
				: [[sortBy || "created_date", sortOrder || "desc"]],
			offset: (page - 1) * limit,
		});

		const { count: countAll, rows: allTickets } =
			await db.Ticket.findAndCountAll();
		const stats = {
			total: countAll,
			open: allTickets.filter((ticket) => ticket.status === "OPEN").length,
			closed: allTickets.filter((ticket) => ticket.status === "CLOSED").length,
			progress: allTickets.filter((ticket) => ticket.status === "PROGRESS")
				.length,
		};

		const nextlink =
			page * limit < count
				? `/api/tickets?limit=${limit}&page=${page + 1}`
				: null;
		const prevlink =
			page > 1 ? `/api/tickets?limit=${limit}&page=${page - 1}` : null;

		return res.status(200).json({
			tickets,
			total: countAll,
			limit,
			page,
			stats,
			next: nextlink,
			previous: prevlink,
		});
	} catch (error) {
		console.log(error);
		return res.status(400).json({ error: error.message });
	}
};

const createTicket = async (req, res) => {
	const {
		location,
		cust_name,
		cust_no,
		cust_email,
		product,
		subproduct,
		assigned_to,
		department,
		casesubject,
		description,
	} = req.body;

	const trx = await db.sequelize.transaction();

	let user;
	let user_role;
	try {
		const user_id = req.userData.id;
		user = await db.User.findOne({
			where: {
				user_id,
			},
		});
		user_role = await user.getRole();
		const user_privileges = await user_role.getPrivileges();
		const privileges = user_privileges.map(
			(privilege) => privilege.privilege_id
		);
		if (!privileges.includes("TICKET_CREATE")) {
			return res.status(401).json({ error: "Unauthorized" });
		}
	} catch (err) {
		return res.status(400).json({ error: err.message });
	}

	try {
		const lastId = await db.Ticket.max("id");
		const newId = lastId + 1;

		const { product_name } = await db.Product.findOne({
			where: {
				product_id: product,
			},
		});

		const generatedId =
			product_name.substring(0, 3).toUpperCase() + padStart(newId, 4);

		const newTicket = db.Ticket.build({
			ticket_id: generatedId,
			location,
			cust_name,
			cust_no,
			cust_email,
			product,
			subproduct,
			assigned_to,
			department,
			casesubject,
			description,
			created_by: user.user_id,
			created_by_dept: user_role.role_category,
		});

		const caseSubject = await db.CaseSubject.findOne({
			where: {
				id: casesubject,
			},
		});

		await generateSLA(newTicket, caseSubject.severity);

		await newTicket.save({ transaction: trx });

		req.files.forEach(async (file) => {
			await newTicket.createAttachment(
				{
					attachment_url: file.path,
				},
				{ transaction: trx }
			);
		});

		await notificationController.makeNotification(newTicket, "TICKET_CREATE");

		await trx.commit();

		EmailService.sendTicketCreatedEmail(newTicket);

		return res.status(200).json({ newTicket });
	} catch (error) {
		console.log(error);
		await trx.rollback();
		return res.status(400).json({ error: error.message });
	}
};

const getTicketById = async (req, res) => {
	const id = req.params.id;

	try {
		const ticket = await db.Ticket.findOne({
			where: {
				ticket_id: id,
			},
			include: [
				{ model: db.Product, attributes: ["product_name"] },
				{ model: db.Subproduct, attributes: ["subproduct_name"] },
				{ model: db.CaseSubject, attributes: ["subject", "severity"] },
				{ model: db.User, attributes: ["name"], as: "pic" },
				{ model: db.User, attributes: ["name"], as: "createdBy" },
				{ model: db.Attachment, attributes: ["attachment_url"] },
			],
		});

		if (!ticket) {
			return res.status(404).json({ error: "Ticket not found" });
		}
		return res.status(200).json({ ticket });
	} catch (err) {
		return res.status(400).json({ error: err.message });
	}
};

const deleteTicketById = async (req, res) => {
	const id = req.params.id;

	const trx = await db.sequelize.transaction();

	try {
		const ticket = await db.Ticket.findOne({
			where: {
				ticket_id: id,
			},
		});

		if (!ticket) {
			return res.status(404).json({ error: "Ticket not found" });
		}

		if (ticket.created_by !== req.userData.id) {
			return res.status(401).json({ error: "Unauthorized" });
		}

		await notificationController.deleteNotificationOfTicket(ticket.id);

		const attachments = await ticket.getAttachments();
		attachments.forEach(async (attachment) => {
			fs.unlinkSync(attachment.attachment_url);
			await attachment.destroy({ transaction: trx });
		}),
			await ticket.destroy({ transaction: trx });

		await trx.commit();
		return res.status(200).json({ message: "Ticket deleted" });
	} catch (err) {
		await trx.rollback();
		console.log(err);
		return res.status(400).json({ error: err.message });
	}
};

const modifyTicketStatus = async (req, res) => {
	const { id } = req.params;

	const { status } = req.body;

	try {
		const ticket = await db.Ticket.findOne({
			where: {
				ticket_id: id,
			},
			include: [
				{ model: db.Product, attributes: ["product_name"] },
				{ model: db.Subproduct, attributes: ["subproduct_name"] },
				{ model: db.CaseSubject, attributes: ["subject", "severity"] },
				{ model: db.User, attributes: ["name"], as: "pic" },
			],
		});

		if (status === "CLOSED") {
			if (req.userData.id !== ticket.created_by)
				return res.status(401).json({ error: "Unauthorized" });

			const { solution } = req.body;
			ticket.status = status;
			ticket.solution = solution;
			ticket.closed_date = new Date();
			ticket.sla = null;

			await notificationController.makeNotification(ticket, "TICKET_CLOSED");
			EmailService.sendTicketClosedEmail(ticket);
		} else if (status === "PROGRESS") {
			ticket.status = status;
			ticket.pic_id = req.userData.id;

			await notificationController.makeNotification(ticket, "TICKET_PROGRESS");
			EmailService.sendTicketTakenEmail(ticket);
		}

		await ticket.save();

		return res.status(200).json({ ticket });
	} catch (err) {
		return res.status(400).json({ error: err.message });
	}
};

const getTicketComments = async (req, res) => {
	const { id } = req.params;

	try {
		const comments = await db.Comment.findAll({
			where: {
				ticket_id: id,
			},
			include: [
				{ model: db.User, attributes: ["name"] },
				{ model: db.Attachment, attributes: ["attachment_url"] },
			],
		});
		// setTimeout(() => {
		return res.status(200).json({ comments });
		// }, 3000)
	} catch (err) {
		return res.status(400).json({ error: err.message });
	}
};

const createTicketComment = async (req, res) => {
	const { id } = req.params;
	const { comment_body } = req.body;
	const user = req.userData.id;

	const trx = await db.sequelize.transaction();

	// Check if ticket user is the PIC of the ticket
	const ticket = await db.Ticket.findOne({
		where: {
			ticket_id: id,
		},
		attributes: ["pic_id", "created_by"]
	})
	console.log(user, ticket.pic_id)
	console.log(user, ticket.created_by)
	console.log(ticket.pic_id !== user && ticket.created_by !== user);
	if (ticket.pic_id !== user && ticket.created_by !== user) {
		return res.status(401).json({ error: "Unauthorized" });
	}

	const file = req.file;
	console.log(file);

	// Add Comment
	try {
		const comment = await db.Comment.create(
			{
				comment_body,
				ticket_id: id,
				user_id: user,
			},
			{
				transaction: trx,
			}
		);

		let attachment;
		if (file) {
			attachment = await comment.createAttachment(
				{
					attachment_url: file.path,
					ticket_id: id,
				},
				{
					transaction: trx,
				}
			);
		}

		await trx.commit();

		await notificationController.makeNotification(comment, "TICKET_COMMENT");

		return res.status(201).json({ comment, attachment });
	} catch (err) {
		await trx.rollback();
		return res.status(400).json({ error: err.message });
	}
};

const getTicketsReport = async (req, res) => {
	const start = req.body.start || decodeURIComponent(req.query.start);
	const end = req.body.end || decodeURIComponent(req.query.end);

	let tickets;

	// Filtering algorithm
	let filterParse = {};
	let where = {};
	// Filtering algorithm
	if (req.query.filter) {
		filterParse = JSON.parse(req.query.filter);
		// where = {};
		if (filterParse.product) {
			where.product = parseInt(filterParse.product);
		}
		if (filterParse.status) {
			where.status = filterParse.status;
		}
		if (filterParse.subject) {
			where.casesubject = filterParse.subject;
		}
		if (filterParse.severity) {
			where["$CaseSubject.severity$"] = filterParse.severity;
		}
		if (filterParse.sla) {
			if (filterParse.sla === "OVERDUE") {
				where.sla = { [Op.lt]: 0 };
			} else {
				where.sla = { [Op.lte]: parseInt(filterParse.sla) };
			}
		}
	}

	try {
		tickets = await db.Ticket.scope("reportable").findAll({
			where: {
				[Op.and]: [
					{
						created_date: {
							[Op.between]: [start, end],
						},
					},
					where,
				],
			},
			include: [
				{ model: db.Product, attributes: ["product_name"] },
				{ model: db.Subproduct, attributes: ["subproduct_name"] },
				{ model: db.CaseSubject, attributes: ["subject", "severity"] },
				{ model: db.User, attributes: ["name"], as: "pic" },
			],
		});

		const casesubject_subject =
			where.casesubject &&
			(await db.CaseSubject.findByPk(where.casesubject).then(
				(subject) => subject.subject
			));

		const product_name =
			where.product &&
			(await db.Product.findByPk(where.product).then(
				(product) => product.product_name
			));

		const doc = await generateReportPDF(
			tickets,
			start,
			end,
			filterParse,
			casesubject_subject,
			product_name
		);

		doc.pipe(res);
		// return res.status(200).json({ filename });
	} catch (err) {
		return res.status(400).json({ error: err.message });
	}
};

const getFilterParameters = async (req, res) => {
	try {
		const products = await db.Product.findAll({
			attributes: [
				["product_id", "option_value"],
				["product_name", "option_name"],
			],
		});
		const casesubjects = await db.CaseSubject.findAll({
			attributes: [
				["id", "option_value"],
				["subject", "option_name"],
			],
		});
		const departments = await db.Role.findAll({
			attributes: [["role_category", "option_value"]],
			group: ["role_category"],
		});

		return res.status(200).json({ products, casesubjects, departments });
	} catch (err) {
		console.log(err);
		return res.status(400).json({ error: err.message });
	}
};

const addNewAttachment = async (req, res) => {};

module.exports = {
	getAllTickets,
	createTicket,
	getTicketById,
	modifyTicketStatus,
	getTicketComments,
	createTicketComment,
	getTicketsReport,
	deleteTicketById,
	getFilterParameters,
	addNewAttachment,
};

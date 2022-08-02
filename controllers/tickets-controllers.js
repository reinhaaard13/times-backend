const { Op } = require("sequelize");

const db = require("../models");

const padStart = require("../helper/padStart");
const { generateSLA } = require("../helper/sla");
const generateReportPDF = require('../helper/generateReportPdf')
const notificationController = require('./notification-controllers');
const notification = require("../models/notification");

const getAllTickets = async (req, res) => {
	const limit = +req.query.limit || 10;
	const page = +req.query.page || 1;

	try {
		const { count, rows: tickets } = await db.Ticket.findAndCountAll({
			include: [
				{ model: db.Product, attributes: ["product_name"] },
				{ model: db.CaseSubject, attributes: ["subject", "severity"] },
			],
			limit,
			offset: (page - 1) * limit,
		});

		const allTickets = await db.Ticket.findAll();
		const stats = {
			total: count,
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
			
		// setTimeout(() => {
		// 	return res.status(200).json({
		// 		tickets,
		// 		total: tickets.length,
		// 		limit,
		// 		page,
		// 		stats,
		// 		next: nextlink,
		// 		previous: prevlink,
		// 	});
		// }, 3000)
		return res.status(200).json({
			tickets,
			total: tickets.length,
			limit,
			page,
			stats,
			next: nextlink,
			previous: prevlink,
		});
	} catch (error) {
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

	let user;
	try {
		const user_id = req.userData.id;
		user = await db.User.findOne({
			where: {
				user_id,
			},
			include: {
        model: db.Role,
        attributes: ["role_id"],
        include: {
          model: db.Privilege,
          attributes: ["privilege_id"]
        }
      }
		})
		const privileges = user.Role.Privileges.map(privilege => privilege.privilege_id);
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
			attachment: req.file?.path,
			created_by: user.user_id,
		});

		const caseSubject = await db.CaseSubject.findOne({
			where: {
				id: casesubject,
			}
		})

		await generateSLA(newTicket, caseSubject.severity);

		await newTicket.save()

		await notificationController.makeNotification(newTicket, "TICKET_CREATE")

		return res.status(200).json({ newTicket });
	} catch (error) {
		console.log(error);
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
				{ model: db.User, attributes: ["name"], as: "pic" }
			],
		});

		if (status === "CLOSED") {
			if (req.userData.id !== ticket.created_by)
				return res.status(401).json({ error: "Unauthorized" });

			const { solution } = req.body;
			ticket.status = status
			ticket.solution = solution;
			ticket.closed_date = new Date();
			ticket.sla = null

			await notificationController.makeNotification(ticket, "TICKET_CLOSED")
		} else if (status === "PROGRESS") {
			ticket.status = status;
			ticket.pic_id = req.userData.id;

			await notificationController.makeNotification(ticket, "TICKET_PROGRESS")
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
			include: [{ model: db.User, attributes: ["name"] }],
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

	// Check if ticket user is the PIC of the ticket

	// Add Comment
	try {
		const comment = await db.Comment.create({
			comment_body,
			ticket_id: id,
			user_id: user,
		});

		await notificationController.makeNotification(comment, "TICKET_COMMENT")

		return res.status(201).json({ comment });
	} catch (err) {
		return res.status(400).json({ error: err.message });
	}
};

const getTicketsReport = async (req, res) => {
	const start = req.body.start || decodeURIComponent(req.query.start);
	const end = req.body.end || decodeURIComponent(req.query.end);
	
	let tickets

	try {
		tickets = await db.Ticket.findAll({
			where: {
				created_date: {
					[Op.between]: [start, end],
				},
			},
			include: [
				{ model: db.Product, attributes: ["product_name"] },
				{ model: db.Subproduct, attributes: ["subproduct_name"] },
				{ model: db.CaseSubject, attributes: ["subject", "severity"] },
				{ model: db.User, attributes: ["name"], as: "pic" },
			],
		});
		

		const doc = await generateReportPDF(tickets, start, end)

		doc.pipe(res)
		// return res.status(200).json({ filename });
		
	} catch (err) {
		return res.status(400).json({ error: err.message });
	}
}

module.exports = {
	getAllTickets,
	createTicket,
	getTicketById,
	modifyTicketStatus,
	getTicketComments,
	createTicketComment,
	getTicketsReport
};

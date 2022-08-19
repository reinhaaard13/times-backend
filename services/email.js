const nodemailer = require("nodemailer");
const ejs = require("ejs");
const moment = require("moment");

const db = require("../models");
const { Op } = require("sequelize");

class EmailService {
	constructor() {
		this.transporter = nodemailer.createTransport({
			service: "gmail",
			auth: {
				user: process.env.GMAIL_ACCOUNT,
				pass: process.env.GMAIL_PASSWORD,
			},
		});
	}

	async generateHTML(type, data) {
		let html;
		if (type === "new_ticket") {
			html = await ejs.renderFile("src/views/content_newticket.ejs", {
				ticket_id: data.ticket_id,
				severity: data.CaseSubject.severity,
				product: data.Product.product_name,
				subproduct: data.Subproduct.subproduct_name,
				name: data.cust_name,
				phone: data.cust_no,
				location: data.location,
				created_date: moment(data.created_date).format("DD-MM-YYYY HH:mm:ss"),
				case_subject: data.CaseSubject.subject,
				assigned_to: data.assigned_to,
			});
		} else if (type === "ticket_closed") {
			const created_by = await data.getCreatedBy();
			html = await ejs.renderFile("src/views/content_ticketclosed.ejs", {
				ticket_id: data.ticket_id,
				created_by: created_by.name,
				closed_date: moment(data.closed_date).format("DD-MM-YYYY HH:mm:ss"),
				solution:
					data.solution.length > 0 ? data.solution : "No Solution Provided",
				case_subject: data.CaseSubject.subject,
			});
		} else if (type === "ticket_taken") {
			const pic = await data.getPic();
			html = await ejs.renderFile("src/views/content_tickettaken.ejs", {
				ticket_id: data.ticket_id,
				pic: pic.name,
				case_subject: data.CaseSubject.subject,
				description: data.description,
			});
		} else if (type === "reminder") {
			html = await ejs.renderFile("src/views/content_reminder.ejs", {
				openTicketsCount: data.openTickets?.length,
				progressTicketsCount: data.progressTickets?.length,
				openTickets: data.openTickets,
				progressTickets: data.progressTickets,
				departmentOpenTickets: data.departmentOpenTickets,
			});
		}
		return html;
	}

	async getRecipientEmailByDepartment(department) {
		const email = await db.User.findAll({
			where: {
				"$Role.role_category$": department,
			},
			include: [{ model: db.Role, attributes: ["role_category"] }],
		});
		return email.map((item) => item.email);
	}

	async sendTicketCreatedEmail(newTicket) {
		const ticket = await db.Ticket.findOne({
			where: {
				ticket_id: newTicket.ticket_id,
			},
			include: [
				{ model: db.CaseSubject, attributes: ["severity", "subject"] },
				{ model: db.Product, attributes: ["product_name"] },
				{ model: db.Subproduct, attributes: ["subproduct_name"] },
			],
		});
		const department = ticket.assigned_to;

		const recipients = await this.getRecipientEmailByDepartment(department);

		recipients.forEach(async (recipient) => {
			return this.transporter.sendMail(
				{
					from: process.env.GMAIL_ACCOUNT,
					to: recipient,
					subject: "New Ticket Created",
					html: await this.generateHTML("new_ticket", ticket),
				},
				(err, info) => {
					if (err) {
						console.log(err);
						throw new Error(err);
					}
					console.log("Email has been sent with ID: " + info.messageId);
				}
			);
		});
	}

	async sendTicketClosedEmail(ticket) {
		const user = await ticket.getPic();
		const recipient = user.email;

		return this.transporter.sendMail(
			{
				from: process.env.GMAIL_ACCOUNT,
				to: recipient,
				subject: "Ticket Has Been Closed",
				html: await this.generateHTML("ticket_closed", ticket),
			},
			(err, info) => {
				if (err) {
					console.log(err);
					throw new Error(err);
				}
				console.log("Email has been sent with ID: " + info.messageId);
			}
		);
	}

	async sendTicketTakenEmail(ticket) {
		const user = await ticket.getCreatedBy();
		const recipient = user.email;

		return this.transporter.sendMail(
			{
				from: process.env.GMAIL_ACCOUNT,
				to: recipient,
				subject: "Your Ticket Is Now In Progress",
				html: await this.generateHTML("ticket_taken", ticket),
			},
			(err, info) => {
				if (err) {
					console.log(err);
					throw new Error(err);
				}
				console.log("Email has been sent with ID: " + info.messageId);
			}
		);
	}

	async sendReminderEmail() {
		const tickets = await db.Ticket.findAll({
			where: {
				[Op.and]: [
					{
						status: {
							[Op.or]: ["OPEN", "PROGRESS"],
						},
					},
					{
						sla: {
							[Op.lte]: 1,
						},
					},
				],
			},
			include: [
				{ model: db.CaseSubject, attributes: ["severity", "subject"] },
				{ model: db.Product, attributes: ["product_name"] },
				{ model: db.Subproduct, attributes: ["subproduct_name"] },
			],
		});

		let users = [];

		let departments = tickets.map((ticket) => ticket.assigned_to);
		departments = Array.from(new Set(departments));
		for (const department of departments) {
			const user = await db.User.findAll({
				where: {
					"$Role.role_category$": department,
				},
				include: [{ model: db.Role, attributes: ["role_category"] }],
			});
			users = users.concat(user);
		}

		let authorDepartments = tickets.map(ticket => ticket.created_by_dept);
		authorDepartments = Array.from(new Set(authorDepartments));
		for (const department of authorDepartments) {
			const authorDeptUsers = await db.User.findAll({
				where: {
					"$Role.role_category$": department,
				},
				include: [{ model: db.Role, attributes: ["role_category"] }],
			});

			authorDeptUsers.forEach(user => {
				if (users.find(u => u.user_id === user.user_id) === undefined) {
					users.push(user);
				}
			})
		}
		
		tickets.forEach(async (ticket) => {
			const user = await ticket.getPic({
				include: [{ model: db.Role, attributes: ["role_category"] }],
			});
			if (!user) return;
			const found = users.find(
				(foundUser) => foundUser.user_id === user.user_id
			);
			if (!found) {
				users.push(user);
			}
		});

		users.forEach(async (user) => {
			let openTickets;
			if (departments.includes(user.Role.role_category)) {
				openTickets = tickets.filter(
					(ticket) =>
						ticket.assigned_to === user.Role.role_category &&
						ticket.status === "OPEN"
				);
			}

			let progressTickets = tickets.filter(
				(ticket) =>
					ticket.status === "PROGRESS" && ticket.pic_id === user.user_id
			);

			let departmentOpenTickets
			if (authorDepartments.includes(user.Role.role_category)) {
				departmentOpenTickets = tickets.filter(
					(ticket) =>
						ticket.created_by_dept === user.Role.role_category
				);
			}

			return this.transporter.sendMail(
				{
					from: process.env.GMAIL_ACCOUNT,
					to: user.email,
					subject: "Ticket Reminder",
					html: await this.generateHTML("reminder", {
						openTickets,
						progressTickets,
						departmentOpenTickets,
					}),
				},
				(err, info) => {
					if (err) {
						console.log(err);
						throw new Error(err);
					}
					console.log("Email has been sent with ID: " + info.messageId);
				}
			);
		});
	}

	sendEmail(type, data) {}
}

module.exports = EmailService;

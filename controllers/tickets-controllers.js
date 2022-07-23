
const db = require("../models");

const padStart = require('../helper/padStart')

const getAllTickets = async (req, res) => {
	const limit = +req.query.limit || 10;
	const page = +req.query.page || 1;

	try {
		const { count, rows: tickets } = await db.Ticket.findAndCountAll({
			include: [
				{model: db.Product, attributes: ['product_name']},
				{model: db.CaseSubject, attributes: ['subject', 'severity']}
			],
			limit,
			offset: (page - 1) * limit
		})

		const nextlink =
			page * limit < count
				? `/api/tickets?limit=${limit}&page=${page+1}`
				: null;
		const prevlink =
			page > 1
				? `/api/tickets?limit=${limit}&page=${page - 1}`
				: null;
		return res.status(200).json({
			tickets,
			total: tickets.length,
			limit,
			page,
			count,
			next: nextlink,
			previous: prevlink,
		});
	} catch (error) {
		return res.status(400).json({ error: error.message });
	}
}

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

	try {
		const lastId = await db.Ticket.max('id')
		const newId = lastId + 1;

		const { product_name } = await db.Product.findOne({
			where: {
				product_id: product,
			},
		})

		const generatedId =
			product_name.substring(0, 3).toUpperCase() + padStart(newId, 4);

		const newTicket = await db.Ticket.create({
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
			created_by: "admin",
		});
		return res.status(200).json({ newTicket });
	} catch (error) {
		console.log(error);
		return res.status(400).json({ error: error.message });
	}
}

const getTicketById = async (req, res) => {
	const id = req.params.id;

	try {
		const ticket = await db.Ticket.findOne({
			where: {
				ticket_id: id
			},
			include: [
				{model: db.Product, attributes: ['product_name']},
				{model: db.Subproduct, attributes: ['subproduct_name']},
				{model: db.CaseSubject, attributes: ['subject', 'severity']},
			]
		})

		if (!ticket) {
			return res.status(404).json({ error: "Ticket not found" });
		}

		return res.status(200).json({ ticket });
	} catch (err) {
		return res.status(400).json({ error: err.message });
	}
}

const confirmTicket = async (req, res) => {
	const { id } = req.params;

	try {
		const ticket = await db.Ticket.findOne({
			where: {
				ticket_id: id
			}
		})
		ticket.status = "PROGRESS"
		await ticket.save()
		return res.status(200).json({ ticket });
	} catch (err) {
		return res.status(400).json({ error: err.message });
	}
}

module.exports = {
  getAllTickets,
	createTicket,
	getTicketById,
	confirmTicket
}
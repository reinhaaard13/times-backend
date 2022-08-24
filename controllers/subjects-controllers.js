const db = require("../models");

const getAllSubjects = async (req, res) => {
	try {
		const subjects = await db.ticket.CaseSubject.findAll({
			include: [
				{
					model: db.ticket.Subproduct,
					attributes: ["subproduct_name", "subproduct_id"],
					include: [
						{ model: db.ticket.Product, attributes: ["product_name", "product_id"] },
					],
				},
			],
		});
		return res.status(200).json(subjects);
	} catch (err) {
		return res.status(400).json({ error: err.message });
	}
};

const createNewSubject = async (req, res) => {
	const { subject, severity, subproduct_id } = req.body;

	try {
		const newSubject = await db.ticket.CaseSubject.create({
			subject,
			severity,
			subproduct_id
		});
		return res.status(200).json(newSubject);
	} catch (err) {
		return res.status(400).json({ error: err.message });
	}
};

const getSubjectById = async (req, res) => {
	const { id } = req.params;

	try {
		const subject = await db.ticket.CaseSubject.findByPk(id, {
			include: [
				{
					model: db.ticket.Subproduct,
					attributes: ["subproduct_name", "subproduct_id"],
					include: [
						{ model: db.ticket.Product, attributes: ["product_name", "product_id"] },
					],
				},
			],
		});
		return res.status(200).json(subject);
	} catch (err) {
		return res.status(400).json({ error: err.message });
	}
};

const updateSubjectById = async (req, res) => {
	const { id } = req.params;

	try {
		const subject = await db.ticket.CaseSubject.update(req.body, {
			where: {
				id,
			},
		});
		return res.status(200).json(subject);
	} catch (err) {
		return res.status(400).json({ error: err.message });
	}
};

const deleteSubjectById = async (req, res) => {
	const { id } = req.params;

	try {
		const subject = await db.ticket.CaseSubject.destroy({
			where: {
				id,
			},
		});
		return res.status(200).json(subject);
	} catch (err) {
		return res.status(400).json({ error: err.message });
	}
};

module.exports = {
	createNewSubject,
	getAllSubjects,
	getSubjectById,
	updateSubjectById,
	deleteSubjectById,
};

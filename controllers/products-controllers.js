const db = require("../models");

const getAllProducts = async (req, res) => {
	try {
		const products = await db.Product.findAll({
			include: [{ model: db.Subproduct, include: [{ model: db.CaseSubject }] }],
		});
		return res.status(200).json(products);
	} catch (err) {
		return res.status(400).json({ error: err.message });
	}
};

const createProduct = async (req, res) => {
	const { product_name, product_desc } = req.body;

	try {
		const newProduct = await db.Product.create({
			product_name,
			product_desc,
		});
		return res.status(201).json(newProduct);
	} catch (err) {
		return res.status(400).json({ error: err.message });
	}
};

module.exports = {
	getAllProducts,
	createProduct,
};

const db = require('../models')

const getAllSubproducts = async (req, res) => {
  try {
    const subproducts = await db.Subproduct.findAll({
      include: [
        {model: db.Product, attributes: ['product_name']}
      ]
    })
    return res.status(200).json(subproducts)
  } catch (err) {
    return res.status(400).json({ error: err.message })
  }
}

const createSubproduct = async (req, res) => {
  const { subproduct_name, product_id, subproduct_desc } = req.body
  try {
    const newSubproduct = await db.Subproduct.create({
      subproduct_name,
      product_id,
      subproduct_desc
    })
    return res.status(201).json(newSubproduct)
  } catch (err) {
    return res.status(400).json({ error: err.message })
  }
}

module.exports = {
  getAllSubproducts,
  createSubproduct
}
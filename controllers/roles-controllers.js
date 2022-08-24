const db = require('../models')

const getAllRoles = async (req, res) => {
  try {
    const roles = await db.auth.Role.findAll({
      attributes: ['role_id', 'role_name']
    })
    return res.status(200).json(roles)
  } catch (error) {
    return res.status(400).json({ error: error.message })
  }
}

module.exports = {
  getAllRoles
}
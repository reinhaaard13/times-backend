const db = require('../models');

const getAllSubjects = async (req, res) => {
  try {
    const subjects = await db.CaseSubject.findAll();
    return res.status(200).json(subjects);
  } catch (err) {
    return res.status(400).json({ error: err.message });
  }
}

const createNewSubject = async (req, res) => {
  const { subject, severity } = req.body

  try {
    const newSubject = await db.CaseSubject.create({
      subject,
      severity
    })
    return res.status(200).json(newSubject);
  } catch (err) {
    return res.status(400).json({ error: err.message });
  }
}

const getSubjectById = async (req, res) => {
  const { id } = req.params;

  try {
    const subject = await db.CaseSubject.findByPk(id);
    return res.status(200).json(subject);
  } catch (err) {
    return res.status(400).json({ error: err.message });
  }
}

const updateSubjectById = async (req, res) => {
  const { id } = req.params

  try {
    const subject = await db.CaseSubject.update(req.body, {
      where: {
        id
      }
    })
    return res.status(200).json(subject);
  } catch (err) {
    return res.status(400).json({ error: err.message });
  }
}

const deleteSubjectById = async (req, res) => {
  const { id } = req.params;

  try {
    const subject = await db.CaseSubject.destroy({
      where: {
        id
      }
    })
    return res.status(200).json(subject);
  } catch (err) {
    return res.status(400).json({ error: err.message });
  }
}

module.exports = {
  createNewSubject,
  getAllSubjects,
  getSubjectById,
  updateSubjectById,
  deleteSubjectById
}
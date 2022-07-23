const router = require('express').Router();

const subjectsControllers = require('../controllers/subjects-controllers');

router.get('/', subjectsControllers.getAllSubjects)

router.post('/create', subjectsControllers.createNewSubject)

router.get('/:id', subjectsControllers.getSubjectById)

router.patch('/:id', subjectsControllers.updateSubjectById)

router.delete("/:id", subjectsControllers.deleteSubjectById)

module.exports = router
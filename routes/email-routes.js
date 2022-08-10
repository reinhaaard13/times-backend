const router = require('express').Router();

const emailControllers = require('../controllers/email-controllers')

router.get('/', emailControllers.generateHTML);
router.post('/send', emailControllers.sendEmail)


module.exports = router
const router = require('express').Router();

const userController = require('../controllers/users-controllers');

router.get('/', (req, res) => {
  res.send("User Routes")
})

router.post('/login', userController.login);

router.post('/register', userController.register)

module.exports = router;
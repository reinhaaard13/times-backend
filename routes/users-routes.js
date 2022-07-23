const router = require('express').Router();

const userController = require('../controllers/users-controllers');

router.get('/', (req, res) => {
  res.send("User Routes")
})

router.post('/login', userController.login);

module.exports = router;
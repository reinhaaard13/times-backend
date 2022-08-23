const router = require('express').Router();

const userController = require('../controllers/users-controllers');
const notificationController = require('../controllers/notification-controllers');
const checkAuth = require('../middlewares/check-auth');

router.get('/', (req, res) => {
  res.send("User Routes")
})

router.post('/login', userController.login);

router.post('/register', userController.register);

router.post("/refreshToken", userController.refreshToken)

router.get('/notification', checkAuth, notificationController.getUserNotification)

module.exports = router;
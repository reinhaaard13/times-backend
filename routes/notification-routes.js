const router = require("express").Router();

const notificationControllers = require("../controllers/notification-controllers")

// router.get('/:ticket_id', notificationControllers.deleteNotificationOfTicket)

router.get('/', (req, res, next) => {
  res.send('Notification routes')
})

module.exports = router
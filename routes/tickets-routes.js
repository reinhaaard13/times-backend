const router = require("express").Router();

const ticketsControllers = require("../controllers/tickets-controllers");

const fileUpload = require("../middlewares/file-upload");

router.get("/", ticketsControllers.getAllTickets);

router.post(
	"/",
	fileUpload.single("attachment"),
	ticketsControllers.createTicket
);

router.get("/:id", ticketsControllers.getTicketById)

router.patch("/:id/confirm", ticketsControllers.confirmTicket)

module.exports = router;

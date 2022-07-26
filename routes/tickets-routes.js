const router = require("express").Router();

const ticketsControllers = require("../controllers/tickets-controllers");

const fileUpload = require("../middlewares/file-upload");
const checkAuth = require("../middlewares/check-auth")

router.get("/", ticketsControllers.getAllTickets);

router.post(
	"/",
	fileUpload.single("attachment"),
	ticketsControllers.createTicket
);

router.get("/:id", ticketsControllers.getTicketById)

router.patch("/:id/status", ticketsControllers.modifyTicketStatus)

router.get("/:id/comments", ticketsControllers.getTicketComments)

router.post("/:id/comments", checkAuth, ticketsControllers.createTicketComment)

module.exports = router;

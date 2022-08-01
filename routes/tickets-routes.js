const router = require("express").Router();

const ticketsControllers = require("../controllers/tickets-controllers");

const fileUpload = require("../middlewares/file-upload");
const checkAuth = require("../middlewares/check-auth")

router.get("/", ticketsControllers.getAllTickets);

router.post(
	"/",
	checkAuth,
	fileUpload.single("attachment"),
	ticketsControllers.createTicket
);

router.get('/report', ticketsControllers.getTicketsReport)

router.get("/:id", ticketsControllers.getTicketById)

router.patch("/:id/status", checkAuth, ticketsControllers.modifyTicketStatus)

router.get("/:id/comments", ticketsControllers.getTicketComments)

router.post("/:id/comments", checkAuth, ticketsControllers.createTicketComment)


module.exports = router;

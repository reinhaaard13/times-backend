const router = require("express").Router();

const ticketsControllers = require("../controllers/tickets-controllers");

const fileUpload = require("../middlewares/file-upload");
const checkAuth = require("../middlewares/check-auth")

router.get("/", checkAuth, ticketsControllers.getAllTickets);

router.post(
	"/",
	checkAuth,
	fileUpload.array("attachment"),
	ticketsControllers.createTicket
);

router.get('/report', ticketsControllers.getTicketsReport)

router.get('/filters', ticketsControllers.getFilterParameters)

router.get("/:id", ticketsControllers.getTicketById)

router.delete("/:id", checkAuth, ticketsControllers.deleteTicketById)

router.patch("/:id/status", checkAuth, ticketsControllers.modifyTicketStatus)

router.get("/:id/comments", ticketsControllers.getTicketComments)

router.post("/:id/comments", checkAuth, ticketsControllers.createTicketComment)


module.exports = router;

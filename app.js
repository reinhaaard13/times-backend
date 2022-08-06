const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const path = require("path");
const CronJob = require("cron").CronJob;
const { refresh, onComplete } = require("./helper/sla");
const moment = require("moment");

const db = require("./models");

const ticketsRoutes = require("./routes/tickets-routes");
const usersRoutes = require("./routes/users-routes");
const productsRoutes = require("./routes/products-routes");
const subproductRoutes = require("./routes/subproducts-routes");
const rolesRoutes = require("./routes/roles-routes");
const subjectRoutes = require("./routes/subjects-routes");
const notificationRoutes = require("./routes/notification-routes");

const app = express();

app.use(bodyParser.json());

app.use(
	cors({
		origin: "http://localhost:3000",
	})
);
// app.use(cors());

app.use(
	"/uploads/attachments",
	express.static(path.join(__dirname, "uploads", "attachments"))
);

app.use("/reports", express.static(path.join(__dirname, "public", "reports")));

app.use("/api/tickets", ticketsRoutes);

app.use("/api/users", usersRoutes);

app.use("/api/products", productsRoutes);

app.use("/api/subproducts", subproductRoutes);

app.use("/api/roles", rolesRoutes);

app.use("/api/subjects", subjectRoutes);

app.use("/api/notification", notificationRoutes);

const job = new CronJob(
	"0 0 9 * * *",
	refresh,
	onComplete,
	false,
	"Asia/Jakarta"
);

app.get("/api/sla/trigger", async (req, res, next) => {
	job.fireOnTick();
	console.log("! On Trigger");
	res.send("SLA refreshed");
});

// db.sequelize.sync({ alter: true }).then(() => {
db.sequelize.sync().then(() => {
	app.listen(process.env.PORT || 5000, () => {
		console.log(`Server is running at port ${process.env.PORT || 5000}`);

		// SLA Refresh
		job.start();
		console.log(`Next Time Refreshing SLA: ${job.nextDate()}`);
	});
});

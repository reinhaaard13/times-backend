const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const path = require("path");

const db = require("./models");

const ticketsRoutes = require("./routes/tickets-routes");
const usersRoutes = require("./routes/users-routes");
const productsRoutes = require("./routes/products-routes");
const subproductRoutes = require("./routes/subproducts-routes");
const rolesRoutes = require("./routes/roles-routes");
const subjectRoutes = require("./routes/subjects-routes");

const app = express();

app.use(bodyParser.json());

app.use(
	cors({
		origin: "http://localhost:3000",
	})
);

app.use(
	"/uploads/attachments",
	express.static(path.join(__dirname, "uploads", "attachments"))
);

app.use("/api/tickets", ticketsRoutes);

app.use("/api/users", usersRoutes);

app.use("/api/products", productsRoutes);

app.use("/api/subproducts", subproductRoutes);

app.use("/api/roles", rolesRoutes);

app.use("/api/subjects", subjectRoutes);

db.sequelize.sync({alter: true}).then(() => {
	app.listen(process.env.PORT || 5000, () => {
		console.log(`Server is running at port ${process.env.PORT || 5000}`);
	});
});

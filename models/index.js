"use strict";

const fs = require("fs");
const path = require("path");
const Sequelize = require("sequelize");
const basename = path.basename(__filename);
const env = process.env.NODE_ENV || "development";
const config = require(__dirname + "/../config/config.json")[env];
const db = {};

let sequelize;
if (config.use_env_variable) {
	sequelize = new Sequelize(process.env[config.use_env_variable], config);
} else {
	sequelize = new Sequelize(
		config.database,
		config.username,
		config.password,
		config
	);
}

fs.readdirSync(__dirname)
	.filter((file) => {
		return (
			file.indexOf(".") !== 0 && file !== basename && file.slice(-3) === ".js"
		);
	})
	.forEach((file) => {
		const model = require(path.join(__dirname, file))(
			sequelize,
			Sequelize.DataTypes
		);
		db[model.name] = model;
	});

// Ticket Associations
db.Ticket.hasOne(db.CaseSubject, {
	foreignKey: "id",
	sourceKey: "casesubject",
});
db.Ticket.hasOne(db.Product, {
	foreignKey: "product_id",
	sourceKey: "product",
});
db.Ticket.hasOne(db.Subproduct, {
	foreignKey: "subproduct_id",
	sourceKey: "subproduct",
});

// User Associations
db.User.hasOne(db.Role, { foreignKey: "role_id", sourceKey: "role" });

// Role Associations
db.Role.belongsToMany(db.Privilege, {
	through: db.RolePrivilege,
	foreignKey: "role_id",
  otherKey: "privilege_id",
});

// Product Associations
db.Product.hasMany(db.Subproduct, {
	foreignKey: "product_id",
	sourceKey: "product_id",
})

// Subproduct Associations
db.Subproduct.belongsTo(db.Product, {
	foreignKey: "product_id",
	sourceKey: "product_id",
})

// Comments Associations
db.Comment.belongsTo(db.User, {
	foreignKey: "user_id",
	sourceKey: "user_id",
})
db.Comment.belongsTo(db.Ticket, {
	foreignKey: "ticket_id",
	sourceKey: "ticket_id",
})

Object.keys(db).forEach((modelName) => {
	if (db[modelName].associate) {
		db[modelName].associate(db);
	}
});

db.sequelize = sequelize;
db.Sequelize = Sequelize;

module.exports = db;

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
db.Ticket.belongsTo(db.CaseSubject, {
	foreignKey: "casesubject",
	sourceKey: "id",
});
db.Ticket.belongsTo(db.Product, {
	foreignKey: "product",
	sourceKey: "product_id",
});
db.Ticket.belongsTo(db.Subproduct, {
	foreignKey: "subproduct",
	sourceKey: "subproduct_id",
});
db.Ticket.hasMany(db.Comment, {
	foreignKey: "ticket_id",
	sourceKey: "ticket_id",
})
db.Ticket.belongsTo(db.User, {
	foreignKey: "pic_id",
	sourceKey: "user_id",
})

// User Associations
db.User.hasMany(db.Ticket, {
	foreignKey: "pic_id",
	sourceKey: "user_id",
})

// User Associations
db.User.belongsTo(db.Role, { foreignKey: "role", sourceKey: "role_id" });

// Role Privilege Associations
db.Privilege.belongsToMany(db.Role, {
	through: db.RolePrivilege,
	foreignKey: "privilege_id",
  otherKey: "role_id"
});
db.Role.belongsToMany(db.Privilege, {
	through: db.RolePrivilege,
	foreignKey: "role_id",
  otherKey: "privilege_id"
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

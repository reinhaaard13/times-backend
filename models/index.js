"use strict";

const fs = require("fs");
const path = require("path");
const Sequelize = require("sequelize");
const { Op } = require("sequelize");
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
	targetKey: "id",
});
db.Ticket.belongsTo(db.Product, {
	foreignKey: "product",
	targetKey: "product_id",
});
db.Ticket.belongsTo(db.Subproduct, {
	foreignKey: "subproduct",
	targetKey: "subproduct_id",
});
db.Ticket.hasMany(db.Comment, {
	foreignKey: "ticket_id",
	sourceKey: "ticket_id",
});
db.Ticket.belongsTo(db.User, {
	foreignKey: "pic_id",
	targetKey: "user_id",
	as: "pic",
});
db.Ticket.belongsTo(db.User, {
	foreignKey: "created_by",
	targetKey: "user_id",
	as: "createdBy",
});

// Attachment Associations
db.Attachment.belongsTo(db.Ticket, {
	foreignKey: "ticket_id",
	targetKey: "ticket_id",
})
db.Ticket.hasMany(db.Attachment, {
	foreignKey: "ticket_id",
	sourceKey: "ticket_id",
})

// User Associations
db.User.hasMany(db.Ticket, {
	foreignKey: "pic_id",
	sourceKey: "user_id",
	as: "pic",
});
db.User.hasMany(db.Ticket, {
	foreignKey: "pic_id",
	sourceKey: "user_id",
	as: "createdBy",
});

// User Associations
db.User.belongsTo(db.Role, { foreignKey: "role", targetKey: "role_id" });
db.Role.hasMany(db.User, { foreignKey: "role", sourceKey: "role_id" });

// Role Privilege Associations
db.Privilege.belongsToMany(db.Role, {
	through: db.RolePrivilege,
	foreignKey: "privilege_id",
	otherKey: "role_id",
});
db.Role.belongsToMany(db.Privilege, {
	through: db.RolePrivilege,
	foreignKey: "role_id",
	otherKey: "privilege_id",
});

// Product Associations
db.Product.hasMany(db.Subproduct, {
	foreignKey: "product_id",
	sourceKey: "product_id",
});

// Subproduct Associations
db.Subproduct.belongsTo(db.Product, {
	foreignKey: "product_id",
	targetKey: "product_id",
});

// CaseSubject Associations
db.CaseSubject.belongsTo(db.Subproduct, {
	foreignKey: "subproduct_id",
	targetKey: "subproduct_id",
})
db.Subproduct.hasMany(db.CaseSubject, {
	foreignKey: "subproduct_id",
	sourceKey: "subproduct_id",
})

// Comments Associations
db.Comment.belongsTo(db.User, {
	foreignKey: "user_id",
	targetKey: "user_id",
});
db.Comment.belongsTo(db.Ticket, {
	foreignKey: "ticket_id",
	targetKey: "ticket_id",
});

// Notification Associations
db.Notification.belongsTo(db.User, {
	foreignKey: "notifier_id",
	targetKey: "user_id",
});
db.User.hasMany(db.Notification, {
	foreignKey: "notifier_id",
	sourceKey: "user_id",
});

db.NotificationChange.belongsTo(db.User, {
	foreignKey: "actor_id",
	targetKey: "user_id",
});
db.User.hasMany(db.NotificationChange, {
	foreignKey: "actor_id",
	sourceKey: "user_id",
});

db.NotificationObject.hasOne(db.Notification, {
	foreignKey: "notification_object_id",
	sourceKey: "id",
});
db.Notification.belongsTo(db.NotificationObject, {
	foreignKey: "notification_object_id",
	targetKey: "id",
});

db.NotificationChange.belongsTo(db.NotificationObject, {
	foreignKey: "notification_object_id",
	targetKey: "id",
});
db.NotificationObject.hasOne(db.NotificationChange, {
	foreignKey: "notification_object_id",
	sourceKey: "id",
});

db.Ticket.hasMany(db.NotificationObject, {
	foreignKey: "entity_id",
	sourceKey: "id",
	constraints: false,
	scope: {
		entity_type: {
			[Op.or]: ["TICKET_CREATE", "TICKET_PROGRESS", "TICKET_CLOSED"],
		},
	},
});
db.NotificationObject.belongsTo(db.Ticket, {
	foreignKey: "entity_id",
	targetKey: "id",
	constraints: false,
});

db.Comment.hasMany(db.NotificationObject, {
	foreignKey: "entity_id",
	sourceKey: "comment_id",
	constraints: false,
	scope: {
		entity_type: "TICKET_COMMENT",
	},
});
db.NotificationObject.belongsTo(db.Comment, {
	foreignKey: "entity_id",
	targetKey: "comment_id",
	constraints: false,
});

db.NotificationObject.addHook("afterFind", (findResult) => {
	if (!Array.isArray(findResult)) findResult = [findResult];

	for (const instance of findResult) {
		if (
			(instance.entity_type === "TICKET_CREATE" ||
			instance.entity_type === "TICKET_PROGRESS" ||
			instance.entity_type === "TICKET_CLOSED") &&
			instance.Ticket !== undefined
		) {
			instance.entity = instance.Ticket;

			delete instance.Comment;
			delete instance.dataValues.Comment;
		}
		if (instance.entity_type === "TICKET_COMMENT" && instance.Comment !== undefined) {
			instance.entity = instance.Comment;

			delete instance.Ticket;
			delete instance.dataValues.Ticket;
		}
		
		// delete instance.Comment;
		// delete instance.dataValues.Comment;
		// delete instance.Ticket;
		// delete instance.dataValues.Ticket;
	}
});

Object.keys(db).forEach((modelName) => {
	if (db[modelName].associate) {
		db[modelName].associate(db);
	}
});

db.sequelize = sequelize;
db.Sequelize = Sequelize;

module.exports = db;

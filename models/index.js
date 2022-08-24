const db_auth = require('./auth');
const db_ticket = require('./ticket');

const { Op } = require("sequelize");

// Ticket Associations
db_ticket.Ticket.belongsTo(db_ticket.CaseSubject, {
	foreignKey: "casesubject",
	targetKey: "id",
});
db_ticket.Ticket.belongsTo(db_ticket.Product, {
	foreignKey: "product",
	targetKey: "product_id",
});
db_ticket.Ticket.belongsTo(db_ticket.Subproduct, {
	foreignKey: "subproduct",
	targetKey: "subproduct_id",
});
db_ticket.Ticket.hasMany(db_ticket.Comment, {
	foreignKey: "ticket_id",
	sourceKey: "ticket_id",
});
db_ticket.Ticket.belongsTo(db_auth.User, {
	foreignKey: "pic_id",
	targetKey: "user_id",
	as: "pic",
});
db_ticket.Ticket.belongsTo(db_auth.User, {
	foreignKey: "created_by",
	targetKey: "user_id",
	as: "createdBy",
});

// Attachment Associations
db_ticket.Attachment.belongsTo(db_ticket.Ticket, {
	foreignKey: "ticket_id",
	targetKey: "ticket_id",
})
db_ticket.Ticket.hasMany(db_ticket.Attachment, {
	foreignKey: "ticket_id",
	sourceKey: "ticket_id",
})

db_ticket.Attachment.hasOne(db_ticket.Comment, {
	foreignKey: "attachment_id",
})
db_ticket.Comment.belongsTo(db_ticket.Attachment, {
	foreignKey: "attachment_id",
})

// User Associations
db_auth.User.hasMany(db_ticket.Ticket, {
	foreignKey: "pic_id",
	sourceKey: "user_id",
	as: "pic",
});
db_auth.User.hasMany(db_ticket.Ticket, {
	foreignKey: "pic_id",
	sourceKey: "user_id",
	as: "createdBy",
});

// User Associations
db_auth.User.belongsTo(db_auth.Role, { foreignKey: "role", targetKey: "role_id" });
db_auth.Role.hasMany(db_auth.User, { foreignKey: "role", sourceKey: "role_id" });

// Role Privilege Associations
db_auth.Privilege.belongsToMany(db_auth.Role, {
	through: db_auth.RolePrivilege,
	foreignKey: "privilege_id",
	otherKey: "role_id",
});
db_auth.Role.belongsToMany(db_auth.Privilege, {
	through: db_auth.RolePrivilege,
	foreignKey: "role_id",
	otherKey: "privilege_id",
});

// Product Associations
db_ticket.Product.hasMany(db_ticket.Subproduct, {
	foreignKey: "product_id",
	sourceKey: "product_id",
});

// Subproduct Associations
db_ticket.Subproduct.belongsTo(db_ticket.Product, {
	foreignKey: "product_id",
	targetKey: "product_id",
});

// CaseSubject Associations
db_ticket.CaseSubject.belongsTo(db_ticket.Subproduct, {
	foreignKey: "subproduct_id",
	targetKey: "subproduct_id",
})
db_ticket.Subproduct.hasMany(db_ticket.CaseSubject, {
	foreignKey: "subproduct_id",
	sourceKey: "subproduct_id",
})

// Comments Associations
db_ticket.Comment.belongsTo(db_auth.User, {
	foreignKey: "user_id",
	targetKey: "user_id",
});
db_ticket.Comment.belongsTo(db_ticket.Ticket, {
	foreignKey: "ticket_id",
	targetKey: "ticket_id",
});

// Notification Associations
db_ticket.Notification.belongsTo(db_auth.User, {
	foreignKey: "notifier_id",
	targetKey: "user_id",
});
db_auth.User.hasMany(db_ticket.Notification, {
	foreignKey: "notifier_id",
	sourceKey: "user_id",
});

db_ticket.NotificationChange.belongsTo(db_auth.User, {
	foreignKey: "actor_id",
	targetKey: "user_id",
});
db_auth.User.hasMany(db_ticket.NotificationChange, {
	foreignKey: "actor_id",
	sourceKey: "user_id",
});

db_ticket.NotificationObject.hasOne(db_ticket.Notification, {
	foreignKey: "notification_object_id",
	sourceKey: "id",
});
db_ticket.Notification.belongsTo(db_ticket.NotificationObject, {
	foreignKey: "notification_object_id",
	targetKey: "id",
});

db_ticket.NotificationChange.belongsTo(db_ticket.NotificationObject, {
	foreignKey: "notification_object_id",
	targetKey: "id",
});
db_ticket.NotificationObject.hasOne(db_ticket.NotificationChange, {
	foreignKey: "notification_object_id",
	sourceKey: "id",
});

db_ticket.Ticket.hasMany(db_ticket.NotificationObject, {
	foreignKey: "entity_id",
	sourceKey: "id",
	constraints: false,
	scope: {
		entity_type: {
			[Op.or]: ["TICKET_CREATE", "TICKET_PROGRESS", "TICKET_CLOSED"],
		},
	},
});
db_ticket.NotificationObject.belongsTo(db_ticket.Ticket, {
	foreignKey: "entity_id",
	targetKey: "id",
	constraints: false,
});

db_ticket.Comment.hasMany(db_ticket.NotificationObject, {
	foreignKey: "entity_id",
	sourceKey: "comment_id",
	constraints: false,
	scope: {
		entity_type: "TICKET_COMMENT",
	},
});
db_ticket.NotificationObject.belongsTo(db_ticket.Comment, {
	foreignKey: "entity_id",
	targetKey: "comment_id",
	constraints: false,
});

db_ticket.NotificationObject.addHook("afterFind", (findResult) => {
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

// Scopes
db_ticket.Ticket.addScope("reportable", {
	where: {
		private: 0
	}
})

const db = {...db_auth, ...db_ticket};

Object.keys(db).forEach((modelName) => {
	if (db[modelName].associate) {
		db[modelName].associate(db);
	}
});

module.exports = {
  auth: db_auth,
  ticket: db_ticket
};
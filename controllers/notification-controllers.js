const db = require("../models");

const makeNotification = async (entity, type) => {
	const trx = await db.sequelize.transaction();
	try{
		const notification_object = await db.NotificationObject.create({
			entity_type: type,
			entity_id: entity.id || entity.comment_id,
		}, {
			transaction: trx
		});
	
		const notification_change = await db.NotificationChange.create({
			notification_object_id: notification_object.id,
			actor_id: type === "TICKET_PROGRESS" ? entity.pic_id : entity.created_by || entity.user_id,
		}, {
			transaction: trx
		});
	
		let notifier;
	
		switch (type) {
			case "TICKET_CREATE":
				notifier = await db.User.findAll({
					where: {
						"$Role.role_category$": entity.assigned_to,
					},
					include: [{ model: db.Role, attributes: ["role_category"] }],
					attributes: ["user_id"],
				});
				break;
			case "TICKET_COMMENT":
				const ticket = await db.Ticket.findOne({
					where: { ticket_id: entity.ticket_id },
				});
				notifier = await db.User.findAll({
					where: {
						user_id:
							ticket.pic_id === entity.user_id
								? ticket.created_by
								: ticket.pic_id,
					},
					attributes: ["user_id"],
				});
				break;
			case "TICKET_PROGRESS":
				notifier = await db.User.findAll({
					where: {
						user_id: entity.created_by,
					},
					attributes: ["user_id"],
				});
				break
			case "TICKET_CLOSED":
				notifier = await db.User.findAll({
					where: {
						user_id: entity.pic_id,
					},
					attributes: ["user_id"],
				});
				break;
		}
	
		const notification = await db.Notification.bulkCreate(
			notifier.map((user) => ({
				notification_object_id: notification_object.id,
				notifier_id: user.user_id,
			})), {transaction: trx}
		);
		await trx.commit();
	} catch (error) {
		await trx.rollback();
		throw error;
	}
	

	return;
};

const getUserNotification = async (req, res, next) => {
	const notifications = await db.Notification.findAll({
		limit: 10,
    order: [["createdAt", "DESC"]],
		where: {
			notifier_id: req.userData.id,
		},
		include: [
			{
				model: db.NotificationObject,
        include: [
          {
            model: db.NotificationChange,
            attributes: ['actor_id'],
            include: [
              {
                model: db.User,
                attributes: ['name']
              }
            ]
          }
        ]
			},
		],
	});

	const notification_objects = await notifications.map(async (notification) => {
    let payload;
		switch (notification.NotificationObject.entity_type) {
			case "TICKET_CREATE":
			case "TICKET_CLOSED":
			case "TICKET_PROGRESS":
				const ticket = await db.Ticket.findOne({
					where: { id: notification.NotificationObject.entity_id },
					include: [
						{ model: db.Product, attributes: ["product_name"] },
						{ model: db.Subproduct, attributes: ["subproduct_name"] },
						{ model: db.CaseSubject, attributes: ["subject", "severity"] },
						{ model: db.User, attributes: ["name"], as: "pic" },
						{ model: db.User, attributes: ["name"], as: "createdBy" },
					],
				});
        payload = {
          ticket_id: ticket.ticket_id,
					event_location: ticket.location,
          product_name: ticket.Product.product_name,
          subproduct_name: ticket.Subproduct.subproduct_name,
          subject: ticket.CaseSubject.subject,
          pic_name: ticket.pic?.name,
          created_by: ticket.created_by.name,
        }
        break;				
      case "TICKET_COMMENT":
        const comment = await db.Comment.findOne({
          where: { comment_id: notification.NotificationObject.entity_id },
          attributes: ["comment_body", "ticket_id"]
        });
        payload = comment
        break;
		}
		return {
      type: notification.NotificationObject.entity_type,
      id: notification.id,
      actor: notification.NotificationObject.NotificationChange.User.name,
			status: notification.status,
      payload,
      created_at: notification.createdAt,
		};
	});

	res.status(200).json( await Promise.all(notification_objects) );

	notifications.forEach(async n => {
		n.status = "READ"
		await n.save()
	})

	return
};

module.exports = {
	makeNotification,
	getUserNotification,
};

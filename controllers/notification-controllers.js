const db = require("../models");

const { Op } = db.ticket.Sequelize;

const makeNotification = async (entity, type) => {
	const trx = await db.ticket.sequelize.transaction();
	try {
		const notification_object = await db.ticket.NotificationObject.create(
			{
				entity_type: type,
				entity_id: entity.id || entity.comment_id,
			},
			{
				transaction: trx,
			}
		);

		const notification_change = await db.ticket.NotificationChange.create(
			{
				notification_object_id: notification_object.id,
				actor_id:
					type === "TICKET_PROGRESS"
						? entity.pic_id
						: entity.created_by || entity.user_id,
			},
			{
				transaction: trx,
			}
		);

		let notifier;

		switch (type) {
			case "TICKET_CREATE":
				notifier = await db.auth.User.findAll({
					where: {
						"$Role.role_category$": entity.assigned_to,
					},
					include: [{ model: db.auth.Role, attributes: ["role_category"] }],
					attributes: ["user_id"],
				});
				break;
			case "TICKET_COMMENT":
				const ticket = await db.ticket.Ticket.findOne({
					where: { ticket_id: entity.ticket_id },
				});
				notifier = await db.auth.User.findAll({
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
				notifier = await db.auth.User.findAll({
					where: {
						user_id: entity.created_by,
					},
					attributes: ["user_id"],
				});
				break;
			case "TICKET_CLOSED":
				notifier = await db.auth.User.findAll({
					where: {
						user_id: entity.pic_id,
					},
					attributes: ["user_id"],
				});
				break;
		}

		const notification = await db.ticket.Notification.bulkCreate(
			notifier.map((user) => ({
				notification_object_id: notification_object.id,
				notifier_id: user.user_id,
			})),
			{ transaction: trx }
		);
		await trx.commit();
	} catch (error) {
		await trx.rollback();
		throw error;
	}

	return;
};

const getUserNotification = async (req, res, next) => {
	const notifications = await db.ticket.Notification.findAll({
		limit: 10,
		order: [["createdAt", "DESC"]],
		where: {
			notifier_id: req.userData.id,
		},
		include: [
			{
				model: db.ticket.NotificationObject,
				include: [
					{ model: db.ticket.Comment, attributes: ["comment_body", "ticket_id"] },
					{
						model: db.ticket.Ticket,
						include: [
							{ model: db.auth.User, attributes: ["name"], as: "pic" },
							{ model: db.auth.User, attributes: ["name"], as: "createdBy" },
							{ model: db.ticket.CaseSubject, attributes: ["subject"] },
							{ model: db.ticket.Subproduct, attributes: ["subproduct_name"] },
							{ model: db.ticket.Product, attributes: ["product_name"] },
						],
					},
					{
						model: db.ticket.NotificationChange,
						include: [{ model: db.auth.User, attributes: ["name"] }],
					},
				],
			},
		],
	});

	const notification_objects = await notifications.map(async (notification) => {
		let payload;
		switch (notification.NotificationObject.entity_type) {
			case "TICKET_CREATE":
			case "TICKET_CLOSED":
			case "TICKET_PROGRESS":
				payload = {
					ticket_id: notification.NotificationObject.Ticket.ticket_id,
					event_location: notification.NotificationObject.Ticket.location,
					product_name:
						notification.NotificationObject.Ticket.Product.product_name,
					subproduct_name:
						notification.NotificationObject.Ticket.Subproduct.subproduct_name,
					subject: notification.NotificationObject.Ticket.CaseSubject.subject,
					pic_name: notification.NotificationObject.Ticket.pic?.name,
					created_by: notification.NotificationObject.Ticket.createdBy.name,
				};
				break;
			case "TICKET_COMMENT":
				payload = notification.NotificationObject.Comment;
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

	res.status(200).json(await Promise.all(notification_objects));

	notifications.forEach(async (n) => {
		n.status = "READ";
		await n.save();
	});
};

const deleteNotificationOfTicket = async (ticket_id) => {
	const trx = await db.ticket.sequelize.transaction()

	const NotificationObject = await db.ticket.NotificationObject.findAll({
		where: {
			[Op.or]: [
				{
					entity_type: {
						[Op.or]: ["TICKET_CREATE", "TICKET_CLOSED", "TICKET_PROGRESS"],
					},
					entity_id: ticket_id,
				},
				{
					entity_type: "TICKET_COMMENT",
					"$Comment.Ticket.id$": ticket_id,
				},
			],
		},
		include: [
			{ model: db.ticket.Ticket, attributes: ["ticket_id"] },
			{
				model: db.ticket.Comment,
				include: [{ model: db.ticket.Ticket, attributes: ["id"] }],
				attributes: ["comment_id", "ticket_id"],
			},
		],
	});

	try {
		await db.ticket.Notification.destroy({
			where: {
				notification_object_id: NotificationObject.map((n) => n.id),
			},
			transaction: trx,
		});
		await db.ticket.NotificationChange.destroy({
			where: {
				notification_object_id: NotificationObject.map((n) => n.id),
			},
			transaction: trx,
		});
		await db.ticket.NotificationObject.destroy({ 
			where: {
				id: NotificationObject.map((n) => n.id),
			},
			transaction: trx 
		});


		await trx.commit()
	} catch (err) {
		await trx.rollback()
		console.log(err);
		throw new Error("Failed to delete notification");
	}

	return
};

module.exports = {
	makeNotification,
	getUserNotification,
	deleteNotificationOfTicket,
};

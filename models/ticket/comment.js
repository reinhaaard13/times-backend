module.exports = (sequelize, DataTypes) => {
	return sequelize.define(
		"Comment",
		{
			comment_id: {
				type: DataTypes.INTEGER(4).ZEROFILL,
				primaryKey: true,
				autoIncrement: true,
			},
			comment_body: {
				type: DataTypes.TEXT,
				allowNull: false,
			},
			user_id: {
				type: DataTypes.INTEGER,
				allowNull: false,
			},
			ticket_id: {
				type: DataTypes.STRING,
				allowNull: false,
			},
			attachment_id: {
				type: DataTypes.INTEGER(4).ZEROFILL,
				allowNull: true,
			},
		},
		{
			createdAt: "created_date",
			updatedAt: "modified_date",
		}
	);
};

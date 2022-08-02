module.exports = (sequelize, DataTypes) => {
  return sequelize.define("Notification", {
    id: {
      type: DataTypes.INTEGER(4).ZEROFILL,
      primaryKey: true,
      autoIncrement: true,
    },
    notification_object_id: {
      type: DataTypes.INTEGER(4).ZEROFILL,
      allowNull: false,
    },
    notifier_id: {
      type: DataTypes.INTEGER(11).ZEROFILL,
      allowNull: false,
    },
    status: {
      type: DataTypes.STRING,
      allowNull: false,
      enum: ["UNREAD", "READ"],
      defaultValue: "UNREAD"
    }
  })
}


module.exports = (sequelize, DataTypes) => {
  return sequelize.define("NotificationChange", {
    id: {
      type: DataTypes.INTEGER(4).ZEROFILL,
      primaryKey: true,
      autoIncrement: true,
    },
    notification_object_id: {
      type: DataTypes.INTEGER(4).ZEROFILL,
      allowNull: false,
    },
    actor_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    }
  })
}


module.exports = (sequelize, DataTypes) => {
  return sequelize.define("NotificationObject", {
    id: {
      type: DataTypes.INTEGER(4).ZEROFILL,
      primaryKey: true,
      autoIncrement: true,
    },
    entity_type: {
      type: DataTypes.STRING,
      allowNull: false,
      enum: ["TICKET_CREATE", "TICKET_PROGRESS", "TICKET_COMMENT", "TICKET_CLOSED"]
    },
    entity_id: {
      type: DataTypes.INTEGER(4).ZEROFILL,
      allowNull: false,
    }
  })
}
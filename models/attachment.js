

module.exports = (sequelize, DataTypes) => {
  return sequelize.define('Attachment', {
    attachment_id: {
      type: DataTypes.INTEGER(4).ZEROFILL,
      autoIncrement: true,
      primaryKey: true,
    },
    attachment_url: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    ticket_id: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  })
}

module.exports = (sequelize, DataTypes) => {
  return sequelize.define('CaseSubject', {
    id: {
      type: DataTypes.INTEGER(4).ZEROFILL,
      primaryKey: true,
      autoIncrement: true,
      unique: 'id'
    },
    subject: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    severity: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  });
}
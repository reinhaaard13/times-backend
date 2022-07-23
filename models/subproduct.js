module.exports = (sequelize, DataTypes) => {
  return sequelize.define('Subproduct', {
    subproduct_id: {
      type: DataTypes.INTEGER(4).ZEROFILL,
      autoIncrement: true,
      primaryKey: true,
    },
    subproduct_name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    subproduct_desc: {
      type: DataTypes.STRING,
    },
    product_id: {
      type: DataTypes.INTEGER(4).ZEROFILL,
      allowNull: false,
    }
  }, {
    createdAt: 'created_date',
    updatedAt: 'modified_date',
  })
}
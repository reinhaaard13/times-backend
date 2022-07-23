module.exports = (sequelize, DataTypes) => {
  return sequelize.define('RolePrivilege', {
    id: {
      type: DataTypes.INTEGER(11).ZEROFILL,
      primaryKey: true,
      autoIncrement: true,
    },
    role_id: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    privilege_id: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    created_by: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    modified_by: {
      type: DataTypes.STRING,
      default: null,
    }
  }, {
    createdAt: 'created_date',
    updatedAt: 'modified_date',
    tableName: 'role_privilege',
  })
}
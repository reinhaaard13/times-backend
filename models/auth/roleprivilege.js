module.exports = (sequelize, DataTypes, schema) => {
  return sequelize.define('RolePrivilege', {
    id: {
      type: DataTypes.INTEGER(4),
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
    indexes: [
      {
        unique: false,
        fields: ['role_id', 'privilege_id'],
      }
    ],
    schema
  })
}

module.exports = (sequelize, DataTypes) => (
  sequelize.define('Ticket', {
    id: {
      type: DataTypes.INTEGER(4).ZEROFILL,
      autoIncrement: true,
      primaryKey: true,
    },
    ticket_id: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true
    },
    location: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    cust_name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    cust_no: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    cust_email: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    product: {
      type: DataTypes.INTEGER(4).ZEROFILL,
      allowNull: false,
    },
    subproduct: {
      type: DataTypes.INTEGER(4).ZEROFILL,
      allowNull: false,
    },
    assigned_to: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    casesubject: {
      type: DataTypes.INTEGER(4).ZEROFILL,
      allowNull: false,
    },
    description: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    created_by: {
      type: DataTypes.INTEGER(11).ZEROFILL,
      allowNull: false,
    },
    modified_by: {
      type: DataTypes.STRING,
      default: null,
    },
    pic_id: {
      type: DataTypes.INTEGER(11).ZEROFILL,
    },
    status: {
      type: DataTypes.STRING,
      enum: ["OPEN", "PROGRESS", "CLOSED"],
      defaultValue: 'OPEN'
    },
    sla: {
      type: DataTypes.INTEGER,
    },
    solution: {
      type: DataTypes.TEXT,
    },
    closed_date: {
      type: DataTypes.DATE,
    },
    created_by_dept: {
      type: DataTypes.STRING,
    },
    private: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    }
  }, {
    createdAt: 'created_date',
    updatedAt: 'modified_date',
    indexes: [
      {
        unique: true,
        fields: ['ticket_id']
      },
      {
        unique: false,
        fields: ['casesubject']
      },
      {
        unique: false,
        fields: ['product']
      },
      {
        unique: false,
        fields: ['subproduct']
      }
    ]
  })
)
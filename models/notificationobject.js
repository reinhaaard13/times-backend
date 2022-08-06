

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
  }, {
    instanceMethods: {
      getEntity: function(option) {
        if (!this.entity_type) return Promise.resolve(null);
        let mixinMethodName;
        switch (this.entity_type) {
          case "TICKET_CREATE":
          case "TICKET_PROGRESS":
          case "TICKET_CLOSED":
            mixinMethodName = "getTicket";
            break;
          case "TICKET_COMMENT":
            mixinMethodName = "getComment";
            break;
        }
        return this[mixinMethodName](option);
      }
    }
  })
}
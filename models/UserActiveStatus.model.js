const { DataTypes } = require("sequelize");
const sequelize = require("../db/db"); // initialize sequelize instance

const UserActiveStatus = sequelize.define(
  "userActiveStatus",
  {
    userId: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    isActive: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    date: {
      type: DataTypes.DATEONLY,
      defaultValue: DataTypes.NOW, // Set the default value to the current date
      allowNull: false,
    },
  },
  {
    timestamps: false,
  }
);

UserActiveStatus.beforeCreate((userActiveStatus, options) => {
  // Format the date to "YYYY-MM-DD"
  userActiveStatus.date = new Date().toISOString().split("T")[0];
});

module.exports = UserActiveStatus;

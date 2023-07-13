const { DataTypes } = require("sequelize");
const sequelize = require("./../db/db"); // initialize sequelize instance

const States = sequelize.define("states", {
  name: {
    type: DataTypes.STRING,
    allowNull: false,
    trim: true,
  },
  code:{
    type: DataTypes.STRING,
    allowNull: false,
    trim: true,
  }
});

module.exports = States;

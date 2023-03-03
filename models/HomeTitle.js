const { DataTypes } = require("sequelize");
const sequelize = require("./../db/db"); // initialize sequelize instance

const title = sequelize.define("title", {
  title: {
    type: DataTypes.STRING,
    allowNull: false,
    trim: true,
  },
});

module.exports = title;

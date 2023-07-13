const { DataTypes } = require("sequelize");
const sequelize = require("./../db/db"); // initialize sequelize instance

const Occupation = sequelize.define("occupation", {
  name: {
    type: DataTypes.STRING,
    allowNull: false,
    trim: true,
  },
});

module.exports = Occupation;

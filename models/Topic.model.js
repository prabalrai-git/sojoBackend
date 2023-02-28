const { DataTypes } = require("sequelize");
const sequelize = require("./../db/db"); // initialize sequelize instance

const Topic = sequelize.define("topic", {
  name: {
    type: DataTypes.STRING,
    allowNull: false,
    trim: true,
  },

  image: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  publicId: {
    type: DataTypes.STRING,
    allowNull: true,
  },
});

module.exports = Topic;

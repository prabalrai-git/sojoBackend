const { DataTypes } = require("sequelize");
const sequelize = require("./../db/db"); // initialize sequelize instance

const Token = sequelize.define(
  "token",
  {
    token: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    createdAt: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
      allowNull: false,
    },
  },
  {
    // define options for the model
    timestamps: false, // disable automatic timestamp fields
    paranoid: false, // disable soft deletes
    underscored: true, // use snake_case for attribute names
  }
);

module.exports = Token;

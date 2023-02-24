const { DataTypes } = require("sequelize");
const sequelize = require("./../db/db"); // initialize sequelize instance
const bcrypt = require("bcrypt");

const User = sequelize.define("user", {
  username: {
    type: DataTypes.STRING,
    allowNull: false,
    trim: true,
  },
  phone: {
    type: DataTypes.STRING,
    trim: true,
  },
  email: {
    type: DataTypes.STRING,
    trim: true,
  },
  password: {
    type: DataTypes.STRING,
    trim: true,
  },
  socialUserId: {
    type: DataTypes.STRING,
    trim: true,
  },
  registrationType: {
    type: DataTypes.ENUM("email", "google", "apple"),
    allowNull: false,
  },
  isActive: {
    type: DataTypes.BOOLEAN,
    defaultValue: false,
  },
  isComplete: {
    type: DataTypes.BOOLEAN,
    defaultValue: false,
  },
  gender: {
    type: DataTypes.STRING,
    trim: true,
  },
  ageGroup: {
    type: DataTypes.STRING,
    trim: true,
  },
  skipPolitical: {
    type: DataTypes.BOOLEAN,
    defaultValue: false,
  },
  skipNSFW: {
    type: DataTypes.BOOLEAN,
    defaultValue: false,
  },
  role: {
    type: DataTypes.STRING,
    defaultValue: "user",
  },
});

User.beforeCreate(async (user, options) => {
  if (user.password) {
    user.password = await bcrypt.hash(user.password, 10);
  }
});

module.exports = User;

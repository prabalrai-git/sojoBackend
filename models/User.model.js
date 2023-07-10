const { DataTypes } = require("sequelize");
const sequelize = require("./../db/db"); // initialize sequelize instance
const bcrypt = require("bcrypt");
const crypto = require("crypto");

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
    type: DataTypes.ENUM("email", "google", "apple","facebook"),
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

  resetPasswordToken: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  resetPasswordExpires: {
    type: DataTypes.DATE,
    allowNull: true,
  },
});

User.beforeCreate(async (user, options) => {
  if (user.password) {
    user.password = await bcrypt.hash(user.password, 10);
  }
});

User.prototype.generatePasswordResetToken = async function () {
  const token = crypto.randomBytes(20).toString("hex");
  this.resetPasswordToken = token;
  this.resetPasswordExpires = Date.now() + 3600000; // 1 hour
  return token;
};

module.exports = User;

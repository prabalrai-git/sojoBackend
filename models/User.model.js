const mongoose = require("mongoose");
const bcrypt = require("bcrypt");

const UserSchema = new mongoose.Schema({
  username: {
    type: String,
    allowNull: false,
    trim: "",
  },
  phone: {
    type: String,
    trim: true,
  },
  email: {
    type: String,
    trim: "",
  },
  password: {
    type: String,
    trim: "",
  },
  socialUserId: {
    type: String,
    trim: "",
  },
  registrationType: {
    type: String,
    enum: ["email", "google", "apple"],
    allowNull: false,
  },

  isActive: {
    type: Boolean,
    default: false,
  },

  isComplete: {
    type: Boolean,
    default: false,
  },

  gender: {
    type: String,
    trim: true,
  },

  getPoliticalNews: {
    type: Boolean,
    default: true,
  },

  getNSFWNews: {
    type: Boolean,
    default: true,
  },

  occupation: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Occupation",
  },

  topics: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Topic",
    },
  ],
});

UserSchema.pre("save", async function (next) {
  const user = this;
  if (user.isModified("password")) {
    user.password = await bcrypt.hash(user.password, 10);
    next();
  }
  next();
});

const User = mongoose.model("User", UserSchema);

module.exports = User;

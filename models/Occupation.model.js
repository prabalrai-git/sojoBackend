const mongoose = require("mongoose");

const OccupationSchema = new mongoose.Schema({
  name: {
    type: String,
    allowNull: false,
    trim: true,
  },
});

const Occupation = mongoose.model("Occupation", OccupationSchema);

module.exports = Occupation;

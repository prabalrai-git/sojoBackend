const mongoose = require("mongoose");

const TopicSchema = new mongoose.Schema({
  name: {
    type: String,
    allowNull: false,
    trim: true,
  },
});

const Topic = mongoose.model("Topic", TopicSchema);

module.exports = Topic;

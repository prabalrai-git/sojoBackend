const mongoose = require("mongoose");

const NewsSchema = new mongoose.Schema(
  {
    title: {
      type: String,
      allowNull: false,
      trim: true,
    },
    previewText: {
      type: String,
      allowNull: false,
      trim: true,
    },
    news: {
      type: String,
      allowNull: false,
      trim: true,
    },

    topic: [
      {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Topic",
      },
    ],

    occupation: [
      {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Occupation",
      },
    ],

    ageGroup: [
      {
        type: String,
        trim: true,
        allowNull: false,
      },
    ],

    gender: [
      {
        type: String,
        trim: true,
        allowNull: false,
      },
    ],

    isFeatured: {
      type: Boolean,
      default: false,
    },

    isNSFW: {
      type: Boolean,
      default: false,
    },

    isPaid: {
      type: Boolean,
      default: false,
    },

    sponsorURL: {
      type: String,
    },

    image: {
      type: String,
      allowNull: false,
    },

    publicId: {
      type: String,
      allowNull: false,
    },

    views: {
      type: Number,
      default: 0,
    },
  },
  {
    timestamps: true,
  }
);

const News = mongoose.model("News", NewsSchema);

module.exports = News;

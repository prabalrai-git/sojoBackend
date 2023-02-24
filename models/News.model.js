const { DataTypes } = require("sequelize");
const sequelize = require("./../db/db");

const News = sequelize.define(
  "news",
  {
    title: {
      type: DataTypes.STRING,
      allowNull: false,
      trim: true,
    },
    previewText: {
      type: DataTypes.STRING,
      allowNull: false,
      trim: true,
    },
    news: {
      type: DataTypes.STRING,
      allowNull: false,
      trim: true,
    },
    isFeatured: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    isNSFW: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    isPaid: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    sponsorURL: {
      type: DataTypes.STRING,
    },
    image: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    publicId: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    views: {
      type: DataTypes.INTEGER,
      defaultValue: 0,
    },
  },
  {
    timestamps: true,
  }
);

module.exports = News;

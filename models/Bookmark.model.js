const { DataTypes } = require("sequelize");
const sequelize = require("./../db/db"); // initialize sequelize instance

const Bookmark = sequelize.define("bookmarks", {
  bookmark_date: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW,
  },
  isActive: {
    type: DataTypes.BOOLEAN,
    defaultValue: true,
  },
});

module.exports = Bookmark;

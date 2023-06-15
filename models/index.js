const News = require("./News.model");
const Occupation = require("./Occupation.model");
const Token = require("./Token.model");
const Topic = require("./Topic.model");
const User = require("./User.model");
const HomeTitle = require("./HomeTitle");
const NewsTopic = require("./news_topic");
const Bookmark = require("./Bookmark.model");

// relationships
Token.belongsTo(User);
User.belongsTo(Occupation);
User.belongsToMany(Topic, {
  through: "user_topics",
  onDelete: "CASCADE",
  onUpdate: "CASCADE",
});
Bookmark.belongsTo(User);
Bookmark.belongsTo(News);

// define the many-to-many association between News and Topic
News.belongsToMany(Topic, {
  through: NewsTopic,
});

// define the many-to-many association between News and Occupation
News.belongsToMany(Occupation, {
  through: "news_occupation",
});

module.exports = {
  News,
  Occupation,
  Token,
  Topic,
  User,
  HomeTitle,
  NewsTopic,
  Bookmark,
};

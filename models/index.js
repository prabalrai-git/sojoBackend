const News = require("./News.model");
const Occupation = require("./Occupation.model");
const Token = require("./Token.model");
const Topic = require("./Topic.model");
const User = require("./User.model");
const HomeTitle = require("./HomeTitle");
const NewsTopic = require("./news_topic");
const Bookmark = require("./Bookmark.model");
const States = require("./States.model");

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
User.belongsTo(States);
// News.belongsTo(States)

// News.belongsToMany(States,{
//   through:"NewsState",
// })

News.belongsToMany(Topic, {
  through: NewsTopic,
});

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
  States,
};

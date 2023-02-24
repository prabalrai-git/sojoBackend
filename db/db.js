const { Sequelize } = require("sequelize");

module.exports = sequelize = new Sequelize("sojo_news", "root", "root", {
  dialect: "mysql",
  host: "localhost",
});

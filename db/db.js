const { Sequelize } = require("sequelize");

module.exports = sequelize = new Sequelize(
  process.env.DATABASE_NAME || "newdb",
  process.env.DATABASE_USERNAME || "root",
  process.env.DATABASE_PASSWORD || "",
  {
    dialect: "mysql",
    host: "localhost",
    logging:false
  }
);

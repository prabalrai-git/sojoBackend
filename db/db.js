const { Sequelize } = require("sequelize");

module.exports = sequelize = new Sequelize(
<<<<<<< HEAD
  process.env.DATABASE_NAME || "sojonews",
=======
  process.env.DATABASE_NAME || "newdb",
>>>>>>> 6455beda4bc0afb318b66d859be0a2d16eaab5b1
  process.env.DATABASE_USERNAME || "root",
  process.env.DATABASE_PASSWORD || "",
  {
    dialect: "mysql",
    host: "localhost",
    logging:false
  }
);

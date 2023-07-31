require("dotenv").config();
const { Sequelize } = require("sequelize");

module.exports = sequelize = new Sequelize(
  process.env.DATABASE_NAME || "sojonews",
  process.env.DATABASE_USERNAME || "localhost",
  process.env.DATABASE_PASSWORD || "",
  {
    dialect: "mysql",
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    logging: false,
  }
);
// module.exports = sequelize = new Sequelize("sojonews", "root", "", {
//   dialect: "mysql",
//   logging: false,
// });

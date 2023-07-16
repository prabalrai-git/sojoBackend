const express = require("express");
const cors = require("cors");
const sequelize = require("./db/db");
const app = express();
const passport = require("passport");
const { States } = require("./models");
require("./security/passport")(passport);

// middlewares
app.use(cors());
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

// auth routes
app.use("/api/v1/auth", require("./routes/auth.route"));

// global routes
app.use("/api/v1/topics", require("./routes/topic.route"));
app.use("/api/v1/occupations", require("./routes/occupation.route"));
app.use("/api/v1/news", require("./routes/news.route"));
app.use("/api/v1/states", require("./routes/states.route"));

// user routes
app.use("/api/v1/users", require("./routes/user/profile.route"));
app.use("/api/v1/users/news", require("./routes/user/news.route"));
app.use("/api/v1/users/bookmarks", require("./routes/user/bookmarks.route"));

// admin routes
app.use("/api/v1/admin/topics", require("./routes/admin/topics.route"));
app.use(
  "/api/v1/admin/occupations",
  require("./routes/admin/occupation.route")
);
app.use("/api/v1/admin/news", require("./routes/admin/news.route"));
app.use("/api/v1/admin/users", require("./routes/admin/user.route"));
app.use("/api/v1/admin/title", require("./routes/admin/title.route"));

sequelize
  .sync({ alter: false })
  .then(() => {
    console.log("Connected to the database");
  })
  .catch((err) => console.log(err));

module.exports = app;
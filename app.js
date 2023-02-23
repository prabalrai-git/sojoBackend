const express = require("express");
const cors = require("cors");

const app = express();
const passport = require("passport");
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

// user routes
app.use("/api/v1/users", require("./routes/user/profile.route"));

// admin routes
app.use("/api/v1/admin/topics", require("./routes/admin/topics.route"));
app.use(
  "/api/v1/admin/occupations",
  require("./routes/admin/occupation.route")
);
app.use("/api/v1/admin/news", require("./routes/admin/news.route"));

module.exports = app;

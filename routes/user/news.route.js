const router = require("express").Router();
const controller = require("./../../controllers/user/news.controller");
const passport = require("passport");
const { isUser } = require("./../../middlewares/role");

router.get(
  "/",
  passport.authenticate("jwt", { session: false }),
  isUser,
  controller.getNews
);

router.get(
  "/similar/:id",
  passport.authenticate("jwt", { session: false }),
  isUser,
  controller.getSimilarNews
);

module.exports = router;

const router = require("express").Router();
const controller = require("./../controllers/news.controller");
const passport = require("passport");

router.get("/", controller.getTopNews);

router.get("/:id", controller.getNewsById);

router.get("/similar/:id", controller.getSimilarNews);

router.get("/categories/:id", controller.getNewsByCategoryId);

router.get("/search/:term", controller.getNewsBySearchTerm);
router.get(
  "/count/numberOfNewsForToday",
  passport.authenticate("jwt", { session: false }),
  controller.numberOfNewsForToday
);

module.exports = router;

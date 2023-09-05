const router = require("express").Router();
const controller = require("./../../controllers/admin/topic.controller");
const multer = require("./../../middlewares/multer");
const passport = require("passport");
const { isAdmin } = require("./../../middlewares/role");

router.post(
  "/",
  passport.authenticate("jwt", { session: false }),
  isAdmin,
  multer.single("image"),
  controller.postTopic
);

router.patch(
  "/:id",
  passport.authenticate("jwt", { session: false }),
  isAdmin,
  multer.single("image"),
  controller.updateTopic
);

router.delete(
  "/:id",
  passport.authenticate("jwt", { session: false }),
  isAdmin,
  controller.deleteTopic
);

router.get("/getTopicsByPopularity", controller.getTopicsByPopularity);

module.exports = router;

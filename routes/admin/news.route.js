const router = require("express").Router();
const controller = require("./../../controllers/admin/news.controller");
const multer = require("./../../middlewares/multer");
const passport = require("passport");
const { isAdmin } = require("./../../middlewares/role");

router.get(
  "/",
  passport.authenticate("jwt", { session: false }),
  isAdmin,
  controller.getAllNews
);

router.get(
  "/search/:search",
  passport.authenticate("jwt", { session: false }),
  isAdmin,
  controller.getNewsByTitle
);

router.get(
  "/:id",
  passport.authenticate("jwt", { session: false }),
  isAdmin,
  controller.getNewsById
);

router.post(
  "/",
  passport.authenticate("jwt", { session: false }),
  isAdmin,
  multer.single("image"),
  controller.postNews
);

router.post(
  "/sendPushNotification",
  passport.authenticate("jwt", { session: false }),
  isAdmin,
  controller.sendPushNotification
);

router.patch(
  "/:id",
  passport.authenticate("jwt", { session: false }),
  isAdmin,
  multer.single("image"),
  controller.updateNews
);

router.delete(
  "/:id",
  passport.authenticate("jwt", { session: false }),
  isAdmin,
  controller.deleteNews
);

module.exports = router;

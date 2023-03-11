const router = require("express").Router();
const controller = require("./../../controllers/admin/title.controller");
const passport = require("passport");
const { isAdmin } = require("./../../middlewares/role");

router.post(
  "/",
  passport.authenticate("jwt", { session: false }),
  isAdmin,
  controller.postTitle
);

router.get(
  "/",
  passport.authenticate("jwt", { session: false }),
  isAdmin,
  controller.getTitle
);

module.exports = router;

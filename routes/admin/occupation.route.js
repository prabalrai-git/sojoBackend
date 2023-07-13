const router = require("express").Router();
const controller = require("./../../controllers/admin/occupation.controller");
const passport = require("passport");
const { isAdmin } = require("./../../middlewares/role");

router.post(
  "/",
  passport.authenticate("jwt", { session: false }),
  isAdmin,
  controller.postOccupation
);

router.patch(
  "/:id",
  passport.authenticate("jwt", { session: false }),
  isAdmin,
  controller.updateOccupation
);

router.delete(
  "/:id",
  passport.authenticate("jwt", { session: false }),
  isAdmin,
  controller.deleteOccupation
);

module.exports = router;

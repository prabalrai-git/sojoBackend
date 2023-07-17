const router = require("express").Router();
const controller = require("./../../controllers/user/bookmarks.controller");
const passport = require("passport");
const { isUser } = require("./../../middlewares/role");

router.post(
  "/",
  // passport.authenticate("jwt", { session: false }),
  // isUser,
  controller.addBookMark
);

router.post(
  "/toggleOrAddBookmark",
  passport.authenticate("jwt", { session: false }),
  isUser,
  controller.toogleOrAddBookmark
);
router.get(
  "/getBookmarkedNews",
  passport.authenticate("jwt", { session: false }),
  isUser,
  controller.getBookmarkedNews
);

router.get(
  "/getBookmarkedNewsByCategoryId/:id",
  passport.authenticate("jwt", { session: false }),
  isUser,
  controller.getBookmarkedNewsByCategoryId
);

module.exports = router;

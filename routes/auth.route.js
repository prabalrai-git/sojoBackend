const router = require("express").Router();
const controller = require("./../controllers/auth.controller");

router.post("/login", controller.login);

router.post("/signup", controller.signup);

router.post("/verify", controller.postVerificationToken);

router.post("/resend", controller.resendVerificationToken);

router.post("/forgot-password/:email", controller.forgotPassword);

router.post("/reset-password/:token", controller.resetPassword);

module.exports = router;

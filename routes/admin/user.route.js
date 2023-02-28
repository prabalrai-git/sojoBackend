const router = require("express").Router();
const controller = require("./../../controllers/admin/user.controller");

router.get("/", controller.getUsers);

module.exports = router;

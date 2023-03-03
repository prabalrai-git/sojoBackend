const router = require("express").Router();
const controller = require("./../../controllers/admin/title.controller");

router.post("/", controller.postTitle);

router.get("/", controller.getTitle);

module.exports = router;

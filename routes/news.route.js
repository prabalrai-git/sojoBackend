const router = require("express").Router();
const controller = require("./../controllers/news.controller");

router.get("/:id", controller.getNewsById);

module.exports = router;

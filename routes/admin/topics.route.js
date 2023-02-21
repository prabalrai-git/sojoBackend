const router = require("express").Router();
const controller = require("./../../controllers/admin/topic.controller");

router.post("/", controller.postTopic);

router.patch("/:id", controller.updateTopic);

router.delete("/:id", controller.deleteTopic);

module.exports = router;

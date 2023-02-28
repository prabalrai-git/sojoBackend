const router = require("express").Router();
const controller = require("./../../controllers/admin/topic.controller");
const multer = require("./../../middlewares/multer");

router.post("/", multer.single("image"), controller.postTopic);

router.patch("/:id", multer.single("image"), controller.updateTopic);

router.delete("/:id", controller.deleteTopic);

module.exports = router;

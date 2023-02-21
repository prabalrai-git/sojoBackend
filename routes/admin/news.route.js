const router = require("express").Router();
const controller = require("./../../controllers/admin/news.controller");
const multer = require("./../../middlewares/multer");

router.get("/", controller.getAllNews);

router.get("/:id", controller.getNewsById);

router.post("/", multer.single("image"), controller.postNews);

router.patch("/:id", multer.single("image"), controller.updateNews);

router.delete("/:id", controller.deleteNews);

module.exports = router;

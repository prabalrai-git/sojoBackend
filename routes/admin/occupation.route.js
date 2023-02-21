const router = require("express").Router();
const controller = require("./../../controllers/admin/occupation.controller");

router.post("/", controller.postOccupation);

router.patch("/:id", controller.updateOccupation);

router.delete("/:id", controller.deleteOccupation);

module.exports = router;

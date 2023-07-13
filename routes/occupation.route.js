const router = require("express").Router();
const controller = require("./../controllers/occupation.controller");

router.get("/", controller.getOccupations);

router.get("/:id", controller.getOccupationById);

module.exports = router;

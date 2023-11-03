const router = require("express").Router();
const controller = require("./../controllers/states.controller");

router.get("/getAllStates", controller.getAllStates);
router.get("/getStateByPopularity", controller.getStateByPopularity);

module.exports = router;

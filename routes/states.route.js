const router = require("express").Router();
const controller = require("./../controllers/states.controller");

router.get("/getAllStates", controller.getAllStates);



module.exports = router;
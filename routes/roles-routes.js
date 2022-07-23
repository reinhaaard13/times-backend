const router = require("express").Router();

const rolesControllers = require("../controllers/roles-controllers");

router.get('/', rolesControllers.getAllRoles)

module.exports = router
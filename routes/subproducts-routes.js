const router = require("express").Router();

const subproductsControllers = require('../controllers/subproducts-controllers');

// /api/subproducts ENDPOINTS

router.get('/', subproductsControllers.getAllSubproducts);

router.post('/', subproductsControllers.createSubproduct);

module.exports = router
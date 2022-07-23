const router = require('express').Router();

const productsControllers = require('../controllers/products-controllers');

router.get('/', productsControllers.getAllProducts)

router.post('/', productsControllers.createProduct)

module.exports = router
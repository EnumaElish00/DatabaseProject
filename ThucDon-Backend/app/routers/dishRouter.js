const express = require('express');
const router = express.Router();
const dishController = require('../controllers/dishController');

// Dish Router
router.get('/categories', dishController.getAllCategories);
router.get('/origins', dishController.getAllOrigins);
router.get('/', dishController.getAllDishes);
router.get('/:id', dishController.getDishById);
router.get('/category/:category', dishController.getDishesByCategory);
router.get('/origin/:origin', dishController.getDishesByOrigin);
router.get('/details/:id', dishController.getDishDetails);

module.exports = router;

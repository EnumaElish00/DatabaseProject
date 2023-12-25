// Import necessary modules and configurations
const express = require('express');
const db = require('../config/db');

// Dish Controller
const dishController = {
    getAllDishes: async (req, res) => {
        try {
            const [dishes] = await db.execute('SELECT * FROM Dish');
            res.json(dishes);
        } catch (error) {
            console.error('Error getting dishes:', error);
            res.status(500).send('Internal Server Error');
        }
    },

    getDishById: async (req, res) => {
        const { id } = req.params;
        try {
            const [singleDish] = await db.execute('SELECT * FROM Dish WHERE ID = ?', [id]);
            if (singleDish.length > 0) {
                res.json(singleDish[0]);
            } else {
                res.status(404).send('Dish not found');
            }
        } catch (error) {
            console.error('Error getting dish by ID:', error);
            res.status(500).send('Internal Server Error');
        }
    },

    getDishesByCategory: async (req, res) => {
        const { category } = req.params;
        try {
            const [dishes] = await db.execute(
                'SELECT d.* FROM Dish d INNER JOIN Dish_Category dc ON d.ID = dc.ID_Dish INNER JOIN Category c ON dc.ID_Category = c.ID_Category WHERE c.ID_Category = ?',
                [category]
            );
            res.json(dishes);
        } catch (error) {
            console.error('Error getting dishes by category:', error);
            res.status(500).send('Internal Server Error');
        }
    },
    

    getDishesByOrigin: async (req, res) => {
        const { origin } = req.params;
        console.log('origin:', origin);

        try {
            const [dishes] = await db.execute(
                'SELECT Dish.ID, Dish.Name, Dish.Price FROM Dish JOIN Dish_Origin ON Dish.ID = Dish_Origin.ID_Dish WHERE Dish_Origin.ID_Origin = ?',
                [origin]
            );
            res.json(dishes);
        } catch (error) {
            console.error('Error getting dishes by origin:', error);
            res.status(500).send('Internal Server Error');
        }
    },

    getDishDetails: async (req, res) => {
        const { id } = req.params;
        try {
            const [dishDetails] = await db.execute(
                'SELECT d.*, i.Name AS IngredientName, d.Price FROM Dish d INNER JOIN Dish_Ingredient di ON d.ID = di.ID_Dish INNER JOIN Ingredient i ON di.ID_Ingredient = i.ID WHERE d.ID = ?',
                [id]
            );
            res.json(dishDetails);
        } catch (error) {
            console.error('Error getting dish details:', error);
            res.status(500).send('Internal Server Error');
        }
    },

    getAllCategories: async (req, res) => {
        try {
            const [categories] = await db.execute('SELECT * FROM Category');
            res.json(categories);
            console.log(categories);
        } catch (error) {
            console.error('Error getting all categories:', error);
            res.status(500).send('Internal Server Error');
        }
    },

    getAllOrigins: async (req, res) => {
        try {
            const [origins] = await db.execute('SELECT * FROM Origin');
            res.json(origins);
        } catch (error) {
            console.error('Error getting all origins:', error);
            res.status(500).send('Internal Server Error');
        }
    },
    
};

module.exports = dishController;
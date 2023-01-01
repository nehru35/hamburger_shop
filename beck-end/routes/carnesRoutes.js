const express = require('express');
const carnesRoutes = express.Router();
const connection = require('../config/database');

// Listing All meats (carnes) options
carnesRoutes.get("/listaCarnes", (req, res) => {
    connection.query('SELECT * FROM tipo_de_carnes', (error, rows, fields) => {
        if (error) {
            console.log(error);
        } else {
            res.send(rows);
        }
    })
})


module.exports = carnesRoutes;
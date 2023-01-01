const express = require('express');
const paesRoutes = express.Router();
const connection = require('../config/database');

// Listing All Breads (Paes) options
paesRoutes.get("/listaPaes", (req, res) => {
    connection.query('SELECT * FROM tipo_de_paes', (error, rows, fields) => {
        if (error) {
            console.log(error);
        } else {
            res.send(rows);
        }
    })
})

module.exports = paesRoutes;
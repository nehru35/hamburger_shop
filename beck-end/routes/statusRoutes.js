const express = require('express');
const statusRoutes = express.Router();
const connection = require('../config/database');

// Getting all everything from table status_do_pedido
statusRoutes.get("/statusPedido", (req, res) => {
    connection.query('SELECT * FROM status_do_pedido', (error, rows, fields) => {
        if (error) {
            console.log(error);
        } else {
            res.send(rows);
        }
    })
})

module.exports = statusRoutes;
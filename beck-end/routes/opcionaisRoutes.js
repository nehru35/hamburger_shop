const express = require('express');
const opcionaisRoutes = express.Router();
const connection = require('../config/database');

opcionaisRoutes.get("/listaOpcionais", (req, res) => {
    connection.query('SELECT * FROM lista_de_opcionais', (error, rows, fields) => {
        if (error) {
            console.log(error);
        } else {
            res.send(rows);
        }
    })
})

module.exports = opcionaisRoutes;
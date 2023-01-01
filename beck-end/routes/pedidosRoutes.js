const express = require('express');
const pedidosRoutes = express.Router();
const connection = require('../config/database');

// Getting all everything from table pedidos
pedidosRoutes.get("/listarPedidos", (req, res) => {
    connection.query('SELECT * FROM pedidos', (error, rows, fields) => {
        if (error) {
            console.log(error);
        } else {
            res.send(rows);
        }
    })
})

// Deleting a row from table pedidos
pedidosRoutes.post("/eliminarPedido", (req, res) => {
    console.log(req);
    connection.query('DELETE FROM pedidos WHERE id = ?', [req.body.id], (error, rows, fields) => {
        if (error) {
            console.log(error);
        } else {
            res.send(rows);
        }
    })
})

// Iserting into table pedidos
pedidosRoutes.post("/novoPedido", (req, res) => {
    let strOpcionais = JSON.stringify(req.body.opcionais);
    let params = [
        req.body.nome_cliente,
        req.body.carne,
        req.body.pao,
        strOpcionais,
        req.body.status
    ]
    
    let sql = "INSERT INTO pedidos(nomo_cliente, carne, pao, opcionais, status) VALUES(?, ?, ?, ?, ?)";
    connection.query(sql, params, (error, rows, fields) => {
        if (error) {
            console.log(error);
        } else {
            res.send(rows);
        }
    })
})

// Updating
pedidosRoutes.post("/actualizarPedidos", (req, res) => {
    let params = [
        req.body.status,
        req.body.id
    ]
    
    let sql = "UPDATE pedidos SET status = ? WHERE id = ?";
    connection.query(sql, params, (error, rows, fields) => {
        if (error) {
            console.log(error);
        } else {
            res.send(rows);
        }
    })
})

module.exports = pedidosRoutes;
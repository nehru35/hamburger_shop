const mysql = require('mysql2');
const express = require('express');
const bodyparser = require('body-parser');
const cors = require('cors');
const app = express();

app.use(cors());

app.use(bodyparser.json());

let connection = mysql.createConnection({
    host: "127.0.0.1",
    user: "root",
    password: "n3hrugh057",
    database: "hamburgaria_db"
});

connection.connect((error) => {
    if(error) {
        console.log('Error');
    } else {
        console.log("Connected");
    }
}) 

// Getting all everything from table tipo_de_paes
app.get("/listaPaes", (req, res) => {
    connection.query('SELECT * FROM tipo_de_paes', (error, rows, fields) => {
        if (error) {
            console.log(error);
        } else {
            res.send(rows);
        }
    })
})

// Getting all everything from table tipo_de_carnes
app.get("/listaCarnes", (req, res) => {
    connection.query('SELECT * FROM tipo_de_carnes', (error, rows, fields) => {
        if (error) {
            console.log(error);
        } else {
            res.send(rows);
        }
    })
})

// Getting all everything from table lista_de_opcionais
app.get("/listaOpcionais", (req, res) => {
    connection.query('SELECT * FROM lista_de_opcionais', (error, rows, fields) => {
        if (error) {
            console.log(error);
        } else {
            res.send(rows);
        }
    })
})

// Getting all everything from table status_do_pedido
app.get("/statusPedido", (req, res) => {
    connection.query('SELECT * FROM status_do_pedido', (error, rows, fields) => {
        if (error) {
            console.log(error);
        } else {
            res.send(rows);
        }
    })
})

// Getting all everything from table pedidos
app.get("/listarPedidos", (req, res) => {
    connection.query('SELECT * FROM pedidos', (error, rows, fields) => {
        if (error) {
            console.log(error);
        } else {
            res.send(rows);
        }
    })
})

// Deleting a row from table pedidos
app.post("/eliminarPedido", (req, res) => {
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
app.post("/novoPedido", (req, res) => {
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
app.post("/actualizarPedidos", (req, res) => {
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


app.listen(3045, () => {
    console.log('Server running at port: ', 3045);
})
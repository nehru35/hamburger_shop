const mysql = require('mysql2');
const express = require('express');
const app = express();
const bodyparser = require('body-parser');

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
app.get("/pedidos", (req, res) => {
    connection.query('SELECT * FROM pedidos', (error, rows, fields) => {
        if (error) {
            console.log(error);
        } else {
            res.send(rows);
        }
    })
})

// Deleting a row from table pedidos
app.delete("/pedidos/:id", (req, res) => {
    connection.query('DELETE FROM pedido WHERE id = ?', [req.params.id], (error, rows, fields) => {
        if (error) {
            console.log(error);
        } else {
            res.send('DELETED');
        }
    })
})

// Iserting into table pedidos
app.post("/pedidos/:id", (req, res) => {
    let strOpcionais = JSON.stringify(req.params.opcionais);
    let params = [
        req.params.nome_cliente,
        req.params.carne,
        req.params.pao,
        req.params.nome_cliente,
        strOpcionais
    ]
    
    let sql = "INSER INTO pedidos(nome_cliente, carne, pao, opcionais) VALUES(?, ?, ?, ?)";
    connection.query(sql, params, (error, rows, fields) => {
        if (error) {
            console.log(error);
        } else {
            res.send('ADDED');
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

app.listen(3045, () => {
    console.log('Server running at port: ', 3045);
})
const express = require('express');
const bodyparser = require('body-parser');
const cors = require('cors');
const app = express();
const connection = require('./config/database')

app.use(cors());
app.use(bodyparser.json());

// Importing all routes
const paesRoutes = require('./routes/paesRoutes');
const carnesRoutes = require('./routes/carnesRoutes');
const opcionaisRoutes = require('./routes/opcionaisRoutes');
const statusRoutes = require('./routes/statusRoutes');
const pedidosRoutes = require('./routes/pedidosRoutes');

// Using all routes
app.use('/', paesRoutes); 
app.use('/', carnesRoutes); 
app.use('/', opcionaisRoutes); 
app.use('/', statusRoutes); 
app.use('/', pedidosRoutes); 

app.get("/listarLeaderboard", (req, res) => {
    connection.query('SELECT * FROM leaderboard', (error, rows, fields) => {
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
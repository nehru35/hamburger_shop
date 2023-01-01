const express = require('express');
const bodyparser = require('body-parser');
const cors = require('cors');
const app = express();

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

app.listen(3045, () => {
    console.log('Server running at port: ', 3045);
})
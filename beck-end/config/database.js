const mysql = require('mysql2');

const connection = mysql.createConnection({
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
});

module.exports = connection;
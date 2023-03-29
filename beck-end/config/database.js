const mysql = require('mysql2');

const connection = mysql.createConnection({
    host: "*****",
    user: "********",
    password: "*******",
    database: "*********"
});

connection.connect((error) => {
    if(error) {
        console.log('Error');
    } else {
        console.log("Connected");
    }
});

module.exports = connection;
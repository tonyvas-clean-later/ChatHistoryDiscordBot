const mysql = require('mysql');
const dotenv = require('dotenv');

dotenv.config();
module.exports = {};

function getDatabaseConnection(){
    return new Promise((resolve, reject) => {
        try {
            const con = mysql.createConnection({
                host: process.env.DB_HOST,
                user: process.env.DB_USER,
                password: process.env.DB_PASS,
                database: process.env.DB_NAME
            });
            con.connect();
            
            resolve(con);
        } catch (error) {
            reject(error)
        }
    });
}


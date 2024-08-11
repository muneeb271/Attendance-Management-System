const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const cors = require('cors');
const path = require('path');

const app = express();
app.use(bodyParser.json());
app.use(cors());

// Set static folder
app.use(express.static(path.join(__dirname, 'public')));

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',    // Replace with your MySQL username
    password: 'munim2006', // Replace with your MySQL password
    database: 'attendance_system'
});

connection.connect(err => {
    if (err) {
        console.error('Database connection failed:', err.stack);
        return;
    }
    console.log('Connected to database.');
});

app.get('/employees', (req, res) => {
    connection.query('SELECT name FROM employees', (error, results) => {
        if (error) {
            console.error('Error fetching employees:', error);
            res.sendStatus(500);
            return;
        }
        res.json(results);
    });
});

app.get('/attendance', (req, res) => {
    connection.query('SELECT * FROM attendance', (error, results) => {
        if (error) {
            console.error('Error fetching attendance:', error);
            res.sendStatus(500);
            return;
        }
        res.json(results);
    });
});

app.post('/check-in', (req, res) => {
    const { employee_name, date, check_in } = req.body;
    connection.query('INSERT INTO attendance (employee_name, date, check_in) VALUES (?, ?, ?)', 
        [employee_name, date, check_in], 
        (error, results) => {
            if (error) {
                console.error('Error during check-in:', error);
                res.sendStatus(500);
                return;
            }
            res.sendStatus(200);
        }
    );
});

app.post('/check-out', (req, res) => {
    const { employee_name, date, check_out } = req.body;
    connection.query('UPDATE attendance SET check_out = ? WHERE employee_name = ? AND date = ?', 
        [check_out, employee_name, date], 
        (error, results) => {
            if (error) {
                console.error('Error during check-out:', error);
                res.sendStatus(500);
                return;
            }
            res.sendStatus(200);
        }
    );
});

// Serve the HTML file for the root URL
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});


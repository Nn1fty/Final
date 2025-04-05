const express = require('express');
const mysql = require('mysql2');
require('dotenv').config();

const app = express();
const port = 3000;

// Create MySQL connection
const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
});

// Connect to MySQL
db.connect((err) => {
  if (err) {
    console.error('error connecting to MySQL:', err);
    return;
  }
  console.log('Connected to MySQL!');
});

// API route to get users
app.get('/api/users', (req, res) => {
  const query = 'SELECT * FROM users';  // Change this based on your table name
  db.query(query, (err, results) => {
    if (err) {
      console.error('Error fetching users:', err);
      res.status(500).send('Error fetching users');
      return;
    }
    res.json(results);  // Send the results as JSON
  });
});

// Serve static files (your front-end) from the public folder
app.use(express.static('public'));

// Start the server
app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
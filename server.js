require('dotenv').config();
const express = require('express');
const mysql = require('mysql2');
const axios = require('axios');

// Create an express app
const app = express();
const port = 3000;

// MySQL connection
const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME
});

// Connect to the MySQL database
db.connect((err) => {
  if (err) {
    console.error('error connecting to MySQL:', err);
    return;
  }
  console.log('Connected to MySQL!');
});

// Set up a route to interact with the database
app.get('/users', (req, res) => {
  db.query('SELECT * FROM users', (err, results) => {
    if (err) {
      console.error(err);
      res.status(500).send('Error fetching users');
      return;
    }
    res.json(results);
  });
});

// Set up a route to fetch data from a GitHub repository
app.get('/github/repos', async (req, res) => {
  try {
    const response = await axios.get('https://api.github.com/user/repos', {
      headers: {
        Authorization: `token ${process.env.GITHUB_TOKEN}`
      }
    });
    res.json(response.data);
  } catch (error) {
    console.error(error);
    res.status(500).send('Error fetching GitHub repositories');
  }
});

// Start the server
app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
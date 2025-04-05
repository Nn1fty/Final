CREATE DATABASE my_website_db;
CREATE USER 'my_user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON my_website_db.* TO 'my_user'@'localhost';
FLUSH PRIVILEGES;

USE my_website_db;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);
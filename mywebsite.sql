CREATE DATABASE mywebsite;
CREATE USER 'neils'@'localhost' IDENTIFIED BY 'nifty';
GRANT ALL PRIVILEGES ON mywebsite.* TO 'neils'@'localhost';
FLUSH PRIVILEGES;

USE mywebsite;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);
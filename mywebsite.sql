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

INSERT INTO users (name, email, password) VALUES
('John Doe', 'john.doe@example.com', 'password123'),
('Jane Smith', 'jane.smith@example.com', 'securepassword!'),
('Alice Johnson', 'alice.johnson@example.com', 'mystrongpassword99'),
('Bob Brown', 'bob.brown@example.com', '12345abcde'),
('Charlie Davis', 'charlie.davis@example.com', 'qwerty1234'),
('Emily White', 'emily.white@example.com', 'emily_password2025'),
('David Miller', 'david.miller@example.com', 'davidsupersecure1'),
('Sophia Wilson', 'sophia.wilson@example.com', 'sophiaStrongPass'),
('James Taylor', 'james.taylor@example.com', 'james2025!'),
('Olivia Martinez', 'olivia.martinez@example.com', 'OliviaSecure1');
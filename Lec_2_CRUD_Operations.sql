create database crud;
use crud;

CREATE TABLE products
(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2),
    quantity INT
);
INSERT INTO products
VALUES
(1, 'Laptop', 45000, 10),
(2, 'Mouse', 300, 50),
(3, 'Keyboard', 800, 25),
(4, 'Monitor', 12000, 15),
(5, 'Headphones', 500, 30);

SELECT *
FROM products;

UPDATE products
SET price = 400
WHERE product_id = 2;

DELETE FROM products
WHERE product_id = 5;

SELECT product_name, price
FROM products;

SELECT *
FROM products
WHERE price > 500;


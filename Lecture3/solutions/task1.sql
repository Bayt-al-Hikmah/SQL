-- Creating Products Table
CREATE TABLE Products(
product_id  INTEGER PRIMARY KEY AUTOINCREMENT,
product_name TEXT NOT NULL,
category TEXT,
price REAL CHECK (price > 0),
quantity_in_stock INTEGER DEFAULT 0

);

-- Inserting Data To Products Table
INSERT INTO Products (product_name,category,price,quantity_in_stock)
VALUES ('Wireless Mouse','Electronics',25.99,50),
       ('Cotton T-Shirt' ,'Clothing',15.50,100),
       ('Stainless Steel Water Bottle','Home & Kitchen',12.75,75),
       ('Chocolate Chip Cookies','Food',8.99,200),
       ('Leather Wallet','Accessories',35.00,30),
       ('Bluetooth Headphones','Electronics',79.99,25),
       ('Denim Jeans','Clothing',49.95,80),
       ('Fruit Jam','Food',6.25,120),
       ('Canvas Backpack','Accessories',29.99,40),
       ('Ceramic Coffee Mug','Home & Kitchen',9.50,150);

-- Selecting all product information for products in the "Electronics" category.
SELECT * FROM Products WHERE category = 'Electronics';

-- Selecting the names of all products with a price greater than $50.
SELECT product_name FROM Products WHERE price > 50;

-- Selecting The names and prices of the top 3 most expensive products.
SELECT product_name,price FROM Products ORDER BY price DESC LIMIT 3;

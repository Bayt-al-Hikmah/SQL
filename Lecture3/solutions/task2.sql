-- Delete all rows where the price is less than 10.
DELETE FROM Products WHERE price < 10;

-- Update rows where the category is "Electronics", increasing the price by 20% (_old price * 1.2_).
UPDATE Products SET price = price * 1.2 WHERE category = 'Electronics';

-- Change the quantity in stock for the "Wireless Mouse" to 60.
UPDATE Products SET quantity_in_stock = 60 WHERE product_name = 'Wireless Mouse';

-- Use SELECT to retrieve all data from the tables and visualize the changes.
SELECT * FROM Products;

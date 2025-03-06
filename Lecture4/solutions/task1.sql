-- Calculate the total revenue generated from each product category.
SELECT category, SUM(quantity * price) AS total_revenue
FROM Products
JOIN Orders ON Products.product_id = Orders.product_id
GROUP BY Products.category;

-- Determine the average price of products within the "Electronics" category.
SELECT AVG(price) AS average_price FROM Products WHERE category ='Electronics';

-- Identify the product with the highest total sales quantity.
SELECT product_name ,SUM(quantity) AS total_sales 
FROM Products  JOIN Orders ON  Products.product_id = Orders.product_id 
GROUP BY Products.product_name
ORDER BY total_sales DESC
LIMIT 1;

-- Retrieve all products that have not been included in any orders.
SELECT product_id,product_name FROM Products WHERE product_id NOT IN (SELECT DISTINCT product_id  FROM ORDERS);

--- Find the product categories where the average price is higher than the overall average price of all products.
SELECT category, AVG(price) AS average_price FROM Products 
GROUP BY category
HAVING AVG(price) > (SELECT AVG(price) FROM Products);

-- Group orders by month and calculate the total sales for each month.
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(quantity * price) AS total_sales
FROM Orders JOIN Products ON Orders.product_id = Products.product_id
GROUP BY DATE_FORMAT(order_date, '%Y-%m');

-- Filter the grouped results to display only those months where the total sales exceed $10,000.
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(quantity * price) AS total_sales
FROM Orders JOIN Products ON Orders.product_id = Products.product_id
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
HAVING total_sales > 10000;
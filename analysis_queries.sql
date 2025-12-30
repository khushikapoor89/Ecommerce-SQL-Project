-- Total sales analysis
SELECT SUM(p.price * oi.quantity) AS total_sales
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

-- Monthly sales analysis
SELECT MONTH(o.order_date) AS month,
       SUM(p.price * oi.quantity) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY month;

-- Top SElling Products 
SELECT p.product_name,
       SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

-- Repeat Costomers
SELECT customer_id, COUNT(order_id) AS orders_count
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;

-- 2nd Highest Spending Customer
SELECT name, total_spent
FROM (
    SELECT c.name,
           SUM(p.price * oi.quantity) AS total_spent,
           DENSE_RANK() OVER (ORDER BY SUM(p.price * oi.quantity) DESC) AS rnk
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY c.name
) t
WHERE rnk = 2;

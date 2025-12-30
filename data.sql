-- Data Insertion 
-- customers
INSERT INTO customers (name, email, gender, city, signup_date) VALUES
('Rahul', 'rahul@gmail.com', 'Male', 'Delhi', '2023-01-10'),
('Anita', 'anita@gmail.com', 'Female', 'Mumbai', '2023-02-15'),
('Aman', 'aman@gmail.com', 'Male', 'Pune', '2023-03-05');

-- products
 INSERT INTO products (product_name, category, price) VALUES
('Laptop', 'Electronics', 55000),
('Mobile', 'Electronics', 20000),
('Headphones', 'Accessories', 3000);

-- orders 
INSERT INTO orders (customer_id, order_date, order_status) VALUES
(1, '2023-06-01', 'Delivered'),
(2, '2023-06-03', 'Delivered'),
(1, '2023-06-10', 'Pending');

-- order items 
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1);

-- payments 
INSERT INTO payments (order_id, payment_mode, payment_status) VALUES
(1, 'UPI', 'Success'),
(2, 'Card', 'Success'),
(3, 'COD', 'Pending');
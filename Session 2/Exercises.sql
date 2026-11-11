-- Session 2 exercises
USE evu_shop;

-- Exercise 1
SELECT * FROM customers
WHERE created_at > "2024-02-01";

SELECT * FROM orders
WHERE total <= 900 and total >= 250;

SELECT * FROM orders
WHERE status != "PAID";

SELECT customer_id,email FROM customers
WHERE email IS NOT NULL;

-- Exercise 2
SELECT * FROM orders
WHERE total BETWEEN 700 AND 1200;

SELECT * FROM orders
WHERE ordered_at >= "2024-04-05" AND ordered_at < "2024-04-12";

SELECT * FROM orders
WHERE ordered_at BETWEEN "2024-04-05" AND "2024-04-12";

-- Exercise 3
SELECT * FROM orders
WHERE product_id IN (10,11,14);

SELECT * FROM orders
WHERE status NOT IN ('PENDING','CANCELLED');

-- Exercise 4
SELECT * FROM customers
WHERE email IS NULL;

SELECT * FROM orders
WHERE shipped_at IS NOT NULL;

-- Exercise 5
SELECT * FROM customers
WHERE full_name LIKE '%a%';

SELECT * FROM products
WHERE product_name LIKE 'Key%';

SELECT * FROM customers
WHERE city LIKE 'Aa%' AND email IS NOT NULL;

-- Exercise 6
-- Without parentheses: AND evaluated before OR
SELECT order_id, status, total FROM orders
WHERE status = 'PAID'
OR status = 'PENDING'
AND total >= 700;

-- Clear intent: (PAID or PENDING) and expensive
SELECT order_id, status, total FROM orders
WHERE (status = 'PAID' OR status = 'PENDING')
AND total >= 700;

-- Exercise 7
SELECT o.order_id,c.full_name,o.status,o.total,o.ordered_at,o.shipped_at FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
WHERE o.status IN ('PAID','PENDING')
AND o.total >= 700
AND o.shipped_at IS NULL
AND c.email IS NOT NULL
AND (c.city LIKE 'Aa%' OR c.city IN ('Copenhagen')) 
ORDER BY o.total DESC;

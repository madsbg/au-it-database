-- Complex Filter — Worked Example (Ch. 8)

SELECT o.order_id, c.full_name, p.category, o.status, o.total, o.shipped_at
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN products p ON p.product_id = o.product_id
WHERE p.category IN ('Hardware', 'Books')
AND o.total BETWEEN 250 AND 1200
AND (c.city LIKE 'Aa%' OR c.city = 'Copenhagen')
AND o.shipped_at IS NULL
ORDER BY o.total DESC;

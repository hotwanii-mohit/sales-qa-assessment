SELECT COUNT(*) FROM customer;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM shipping;

SELECT * FROM customer 
WHERE customer_id IS NULL OR country IS NULL;

SELECT * FROM orders 
WHERE order_id IS NULL OR amount IS NULL;

SELECT * FROM shipping 
WHERE shipping_id IS NULL OR status IS NULL;

SELECT customer_id, COUNT(*) 
FROM customer 
GROUP BY customer_id 
HAVING COUNT(*) > 1;

SELECT order_id, COUNT(*) 
FROM orders 
GROUP BY order_id 
HAVING COUNT(*) > 1;

SELECT *
FROM orders o
LEFT JOIN customer c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

SELECT *
FROM shipping s
LEFT JOIN customer c ON s.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

SELECT customer_id, COUNT(*) 
FROM shipping
GROUP BY customer_id
HAVING COUNT(*) > 1;


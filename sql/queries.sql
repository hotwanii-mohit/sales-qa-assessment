-- Requirement 1: Total amount spent per country for pending deliveries

WITH pending_customers AS (
    SELECT DISTINCT customer_id
    FROM shipping
    WHERE status = 'Pending'
)
SELECT 
    c.country,
    SUM(o.amount) AS total_amount
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
JOIN pending_customers p ON c.customer_id = p.customer_id
GROUP BY c.country;

-- Requirement 2: Customer summary with product details

SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(o.order_id) AS total_transactions,
    SUM(o.amount) AS total_amount,
    o.product_name
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, customer_name, o.product_name;

-- Requirement 3: Max product per country

WITH product_sales AS (
    SELECT 
        c.country,
        o.product_name,
        COUNT(o.order_id) AS total_orders
    FROM customer c
    JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.country, o.product_name
),
ranked AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY country ORDER BY total_orders DESC) AS rn
    FROM product_sales
)
SELECT *
FROM ranked
WHERE rn = 1;

-- Requirement 4: Most purchased product by age group

WITH age_group AS (
    SELECT 
        CASE 
            WHEN c.age < 30 THEN 'Below 30'
            ELSE 'Above 30'
        END AS age_category,
        o.product_name,
        COUNT(*) AS total_orders
    FROM customer c
    JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY age_category, o.product_name
),
ranked AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY age_category ORDER BY total_orders DESC) AS rn
    FROM age_group
)
SELECT *
FROM ranked
WHERE rn = 1;

-- Requirement 5: Country with minimum transactions and sales

WITH country_stats AS (
    SELECT 
        c.country,
        COUNT(o.order_id) AS total_transactions,
        SUM(o.amount) AS total_sales
    FROM customer c
    JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.country
)
SELECT *
FROM country_stats
ORDER BY total_transactions ASC, total_sales ASC
LIMIT 1;

# Test Cases - Sales Data QA Assessment

---

## Test Case 1: Pending Delivery Amount by Country

**Scenario:**  
Validate total amount spent per country for pending delivery status  

**Steps:**
- Filter customers with pending shipping status  
- Join with orders and customer tables  
- Aggregate total amount by country  

**SQL Query:**
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

**Expected Result:**
Total amount correctly aggregated for each country with pending deliveries

**Actual Result:**
(Attach screenshot)

**Status:**
Pass

**Observation:**
Shipping data exists at customer level, hence DISTINCT was used to avoid duplication.

## Test Case 2: Customer Transaction Summary

**Scenario:**
Validate total transactions and total amount per customer along with product details

**Steps:**

Join customer and orders table
Count total orders per customer
Sum total amount
Group by customer and product

**SQL Query:**

SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(o.order_id) AS total_transactions,
    SUM(o.amount) AS total_amount,
    o.product_name
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, customer_name, o.product_name;

**Expected Result:**
Each customer should have correct transaction count and total amount per product

**Actual Result:**
(Attach screenshot)

**Status:**
Pass

**Observation:**
Quantity data is not available, hence total quantity sold could not be calculated.

## Test Case 3: Maximum Product per Country

**Scenario:**
Identify the most purchased product in each country  

**Steps:**
- Join customer and orders table  
- Count orders per product per country  
- Rank products within each country  
- Select highest ranked product  

**SQL Query:**
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

**Expected Result:**
Top purchased product per country

**Actual Result:**
(Attach screenshot)

**Status:**
Pass

## Test Case 4: Most Purchased Product by Age Category

**Scenario:**
Identify most purchased product for customers below 30 and above 30  

**Steps:**
- Categorize customers based on age  
- Join with orders table  
- Count product purchases  
- Rank products per age group  

**SQL Query:**

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

**Expected Result:**
Top product per age category

**Actual Result:**
(Attach screenshot)

**Status:**
Pass

## Test Case 5: Country with Minimum Transactions and Sales

**Scenario:**
Identify the country with lowest transactions and total sales  

**Steps:**
- Join customer and orders  
- Aggregate transactions and sales per country  
- Sort ascending  
- Select lowest  

**SQL Query:**

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

**Expected Result:**
Country with minimum transactions and sales

**Actual Result:**
(Attach screenshot)

**Status:**
Pass

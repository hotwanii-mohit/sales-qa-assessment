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

##Test Case 2: Customer Transaction Summary

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

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


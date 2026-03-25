# Requirement Gaps Analysis

This section highlights gaps and ambiguities identified in the provided dataset and requirements.

---

## 1. Missing Quantity Field

**Issue:**  
The orders dataset does not contain a quantity column.

**Impact:**  
- Total quantity sold cannot be calculated  
- Requirement partially unfulfilled  

**Assumption:**  
Order count is used as a proxy for quantity where needed  

---

## 2. Age Boundary Condition

**Issue:**  
Requirement does not specify handling for age = 30  

**Impact:**  
- Ambiguity in categorization  

**Assumption:**  
Age >= 30 considered as "Above 30"  

---

## 3. Shipping Data Granularity

**Issue:**  
Shipping data is maintained at customer level instead of order level.

**Impact:**  
- Joining with orders may cause duplication  
- Aggregations may produce incorrect results if not handled carefully  

**Resolution:**  
Used DISTINCT customer_id for pending status filtering  

---

## 4. Amount Definition Not Specified

**Issue:**  
It is unclear whether amount represents:
- Unit price OR
- Total order value  

**Impact:**  
- Aggregation interpretation may vary  

**Assumption:**  
Amount is treated as total order value  

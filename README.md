# Sales Data QA Assessment

## Objective
This project demonstrates a structured QA approach to validate and analyze sales data from multiple sources (Excel, CSV, JSON). The goal is to generate insights and ensure data quality using SQL.

---

## Tools Used
- MySQL Workbench
- Excel (for data conversion)
- SQL

---

## Data Sources
- Customer data (Excel)
- Orders data (CSV)
- Shipping data (JSON)

---

## Approach

### 1. Data Modeling
- Created relational tables: customer, orders, shipping
- Defined primary and foreign keys

### 2. Data Loading
- Converted Excel and JSON into CSV format
- Imported data using MySQL Workbench

### 3. Data Validation
- Performed null checks, duplicate checks, and join validation

### 4. SQL Analysis
- Wrote queries to meet business requirements

### 5. QA Testing
- Created test scenarios and test cases
- Validated expected vs actual results

---

## Business Requirements Covered
1. Total amount spent per country (Pending delivery)
2. Customer-level transaction summary
3. Maximum product purchased per country
4. Most purchased product by age category
5. Country with minimum transactions and sales

---

## Key Observations
- Shipping data is at customer level, not order level (may cause duplication)
- Orders data does not contain quantity field
- Assumptions were made where required

---

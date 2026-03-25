# Data Model

## Tables Created

### Customer Table
- customer_id
- first_name
- last_name
- age
- country

### Orders Table
- order_id
- customer_id
- product_name
- amount

### Shipping Table
- shipping_id
- customer_id
- status

---

## Relationships
- Customer ↔ Orders via customer_id
- Customer ↔ Shipping via customer_id

---

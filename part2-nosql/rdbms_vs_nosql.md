## Comparison: RDBMS vs NoSQL

Based on the datasets provided (`orders_flat.csv` and `orders.json`), we can observe the following key differences:

1. **Schema Design:** In Part 1 (RDBMS), we had to strictly define our tables and relationships (Normalization) before we could even insert data. In NoSQL, the `orders.json` allows us to store data as documents, meaning if a new order suddenly needed a "discount_code" field, we could add it to one document without affecting the others.
2. **Performance at Scale:** RDBMS is excellent for complex joins (like finding which Mumbai customers bought a specific product). However, NoSQL is designed to scale horizontally across many servers, making it better for massive amounts of simple data like user activity logs or real-time order status updates.

## Use Case Scenarios

**Scenario 1: RDBMS is Better (Financial Transactions)**
If the retail company is handling actual payments and bank reconciliations, **RDBMS** is superior. This is because of **ACID compliance**, which ensures that money isn't "lost" during a transfer. If a database crash happens during a transaction, RDBMS can roll back the changes to keep the books balanced.

**Scenario 2: NoSQL is Better (Real-time Product Catalog)**
If the company is building a mobile app with a rapidly changing catalog where products have different attributes (e.g., some have "battery life," others have "fabric material"), **NoSQL** is the better choice. It allows for a **flexible schema**, so developers can add new product categories instantly without having to perform a complex "migration" of the database structure.

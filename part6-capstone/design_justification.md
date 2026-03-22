## Design Justification: Unified Retail Data Platform

### Architecture Overview
The proposed architecture is a **Modern Data Stack** that balances transactional integrity with analytical flexibility. By integrating RDBMS, NoSQL, Data Warehouse, and Vector components, we ensure the business can handle every stage of the data lifecycle—from a customer clicking "Buy" to an executive viewing a yearly sales trend.

### Component Value Add
1. **RDBMS (Transactional Hub):** We use the Relational Database for core order processing. Its ACID compliance ensures that inventory and payments are always accurate, preventing "double-selling" of products.
2. **NoSQL (Flexible Catalog):** The NoSQL layer handles the product catalog and real-time order tracking. Its schema-less nature allows the marketing team to add new product attributes (like "seasonal colors" or "tech specs") without downtime.
3. **Data Lake (Raw Storage):** Utilizing a Data Lake (queried via DuckDB) allows us to store massive amounts of raw logs, JSONs, and Parquet files cost-effectively. It serves as the "Single Source of Truth" before data is cleaned for the warehouse.
4. **Data Warehouse (Star Schema):** This is the brain of the company’s Business Intelligence. By organizing data into a Star Schema, we enable non-technical managers to run complex reports on sales trends and store performance with high speed.
5. **Vector Database (AI Engine):** This adds a competitive edge by powering semantic search and personalized recommendations. It moves the company beyond simple keyword matching to understanding customer intent.

### Conclusion
This architecture is chosen for its **scalability** and **modularity**. Each component is "best-in-class" for its specific task, ensuring that the system remains robust as the retail company grows from a small shop to a national enterprise.

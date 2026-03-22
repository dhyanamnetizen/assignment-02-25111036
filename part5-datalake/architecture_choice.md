## Why DuckDB for Data Lakes?

DuckDB is a superior choice for this "Data Lake" scenario compared to a traditional RDBMS like MySQL for several key reasons:

1. **Zero-ETL (Direct Querying):** Unlike MySQL, which requires you to create a schema and "load" data before querying it, DuckDB can query raw files (`.csv`, `.json`, `.parquet`) directly. This is known as "Schema-on-Read," which is significantly faster for ad-hoc analysis.
2. **Columnar Performance:** Since our Data Lake includes Parquet files, DuckDB’s columnar engine is highly efficient. It only reads the specific columns needed for the query, saving memory and time compared to row-based systems.
3. **In-Process and Local:** DuckDB requires no server setup. It is a lightweight, in-process database that can run directly on a laptop, making it the perfect tool for local data processing and exploratory analysis across disparate file formats.

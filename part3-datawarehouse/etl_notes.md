## ETL Process

To move data from the raw `retail_transactions.csv` file into our Star Schema, we follow the **Extract, Transform, and Load (ETL)** process:

### 1. Extract
We read the raw data from the CSV file. This includes columns like `transaction_id`, `date`, `store_name`, `product_name`, and `units_sold`.

### 2. Transform (The Cleaning Phase)
This is the most critical step because the raw data is "dirty." We must perform the following cleaning operations:
- **Date Standardization:** The dates in the CSV appear in multiple formats (e.g., `29/08/2023`, `12-12-2023`, and `2023-02-05`). We must convert all of these into a single standard format (YYYY-MM-DD) to populate the `Dim_Time` table.
- **Categorical Consistency:** The `category` column contains inconsistencies like "electronics" (lowercase) vs "Electronics" (Proper case) and "Grocery" vs "Groceries." We need to use "Trim" and "Case Conversion" functions to make these uniform.
- **Calculated Columns:** We need to calculate `total_amount` by multiplying `units_sold` and `unit_price` before loading it into the Fact Table.
- **Deduplication:** We must extract unique lists of Products and Stores to create the Dimension tables, ensuring no duplicates exist.

### 3. Load
Finally, we load the cleaned data:
1. First, we populate the **Dimension Tables** (Products, Stores, Time, Customers).
2. Second, we populate the **Fact Table** (`Fact_Sales`), ensuring all foreign keys correctly point to the entries in the Dimension tables.

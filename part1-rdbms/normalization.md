## Anomaly Analysis

Based on the `orders_flat.csv` file, here are three examples of anomalies:

1. **Insert Anomaly:** We cannot add a new Product (e.g., `P010 - Laptop`) into the system without creating a dummy order. Since `order_id` is likely the primary key, it cannot be NULL, meaning product details only exist if an order exists.
2. **Update Anomaly:** If Sales Representative **Deepak Joshi (SR01)** moves to a new office, we have to manually update the `office_address` in dozens of rows. In fact, in the dataset, row 1 uses "Nariman Point" while row 37 uses "Nariman Pt," showing how data becomes inconsistent when repeated.
3. **Delete Anomaly:** If we delete the only order for **Headphones (P005)** (e.g., `ORD1002`), we lose all information about that product, including its name, category, and unit price, because those details only exist within the order record.

## Normalization Justification

The current flat file structure violates **Third Normal Form (3NF)** because it contains transitive dependencies. Specifically, non-key attributes like `customer_name` depend on `customer_id`, which in turn depends on the `order_id`. This means if we want to change a customer's email, we must find and update every single order they have ever placed.

By normalizing the data into four distinct tables—**Customers**, **Products**, **SalesReps**, and **Orders**—we eliminate redundancy. 
- Each piece of information (like a product price or a sales rep email) is stored in exactly **one place**.
- This makes the database "Leaner" (saving storage) and "Cleaner" (preventing data entry errors). 
- It also allows us to maintain records of products or customers even if they don't have active orders currently, solving the Insert and Delete anomalies identified above.

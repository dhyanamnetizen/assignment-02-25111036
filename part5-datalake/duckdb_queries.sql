-- Q1: Unified query joining JSON, CSV, and Parquet files
SELECT 
    o.order_id, 
    c.name AS customer_name, 
    p.product_name, 
    o.total_amount
FROM 'datasets/orders.json' AS o
JOIN 'datasets/customers.csv' AS c 
    ON o.customer_id = c.customer_id
JOIN 'datasets/products.parquet' AS p 
    ON o.product_id = p.product_id
WHERE o.total_amount > 5000;

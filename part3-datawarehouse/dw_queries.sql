-- Q1: Total sales amount per category
SELECT p.category, SUM(f.total_amount) AS total_sales
FROM Fact_Sales f
JOIN Dim_Products p ON f.product_id = p.product_id
GROUP BY p.category;

-- Q2: Find the store with the highest number of units sold
SELECT s.store_name, SUM(f.units_sold) AS total_units
FROM Fact_Sales f
JOIN Dim_Stores s ON f.store_id = s.store_id
GROUP BY s.store_name
ORDER BY total_units DESC
LIMIT 1;

-- Q3: Monthly sales trend (Total revenue per month)
SELECT t.year, t.month, SUM(f.total_amount) AS monthly_revenue
FROM Fact_Sales f
JOIN Dim_Time t ON f.date_key = t.date_key
GROUP BY t.year, t.month
ORDER BY t.year, t.month;

-- Q4: Identify the top 5 customers by total spend
SELECT customer_id, SUM(total_amount) AS total_spend
FROM Fact_Sales
GROUP BY customer_id
ORDER BY total_spend DESC
LIMIT 5;

-- Dim_Products: Stores descriptive data about products
CREATE TABLE Dim_Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- Dim_Stores: Stores location and store details
CREATE TABLE Dim_Stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    store_city VARCHAR(50) NOT NULL
);

-- Dim_Time: Allows for time-based analysis (Month/Year/Quarter)
CREATE TABLE Dim_Time (
    date_key DATE PRIMARY KEY,
    full_date DATE NOT NULL,
    month VARCHAR(20) NOT NULL,
    year INT NOT NULL,
    quarter INT NOT NULL
);

-- Dim_Customers: Stores customer identifiers for tracking
CREATE TABLE Dim_Customers (
    customer_id VARCHAR(10) PRIMARY KEY
);

-- Fact_Sales: The central table containing measurable facts (units, prices)
CREATE TABLE Fact_Sales (
    transaction_id VARCHAR(10) PRIMARY KEY,
    product_id INT NOT NULL,
    store_id INT NOT NULL,
    date_key DATE NOT NULL,
    customer_id VARCHAR(10) NOT NULL,
    units_sold INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Dim_Products(product_id),
    FOREIGN KEY (store_id) REFERENCES Dim_Stores(store_id),
    FOREIGN KEY (date_key) REFERENCES Dim_Time(date_key),
    FOREIGN KEY (customer_id) REFERENCES Dim_Customers(customer_id)
);

-- Inserting Sample Data (5 rows per table)
INSERT INTO Dim_Products VALUES 
(1, 'Speaker', 'Electronics'),
(2, 'Tablet', 'Electronics'),
(3, 'Smartwatch', 'Electronics'),
(4, 'Atta 10kg', 'Grocery'),
(5, 'Jeans', 'Clothing');

INSERT INTO Dim_Stores VALUES 
(101, 'Chennai Anna', 'Chennai'),
(102, 'Delhi South', 'Delhi'),
(103, 'Bangalore MG', 'Bangalore'),
(104, 'Pune FC Road', 'Pune'),
(105, 'Mumbai Central', 'Mumbai');

INSERT INTO Dim_Time VALUES 
('2023-01-15', '2023-01-15', 'January', 2023, 1),
('2023-02-05', '2023-02-05', 'February', 2023, 1),
('2023-03-31', '2023-03-31', 'March', 2023, 1),
('2023-08-09', '2023-08-09', 'August', 2023, 3),
('2023-12-12', '2023-12-12', 'December', 2023, 4);

INSERT INTO Dim_Customers VALUES ('CUST004'), ('CUST007'), ('CUST019'), ('CUST021'), ('CUST045');

INSERT INTO Fact_Sales VALUES 
('TXN5000', 1, 101, '2023-12-12', 'CUST045', 3, 49262.78, 147788.34),
('TXN5001', 2, 101, '2023-12-12', 'CUST021', 11, 23226.12, 255487.32),
('TXN5002', 2, 101, '2023-02-05', 'CUST019', 20, 48703.39, 974067.80),
('TXN5003', 2, 102, '2023-02-05', 'CUST007', 14, 23226.12, 325165.68),
('TXN5004', 3, 101, '2023-01-15', 'CUST004', 10, 58851.01, 588510.10);

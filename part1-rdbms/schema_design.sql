-- Creating the Normalized Tables
CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

CREATE TABLE Products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price INT NOT NULL
);

CREATE TABLE SalesReps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address TEXT NOT NULL
);

CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (sales_rep_id) REFERENCES SalesReps(sales_rep_id)
);

-- Inserting Sample Data (Required 5 rows per table)
INSERT INTO Customers VALUES 
('C001', 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai'),
('C002', 'Priya Sharma', 'priya@gmail.com', 'Delhi'),
('C003', 'Amit Verma', 'amit@gmail.com', 'Bangalore'),
('C005', 'Vikram Singh', 'vikram@gmail.com', 'Mumbai'),
('C006', 'Neha Gupta', 'neha@gmail.com', 'Delhi');

INSERT INTO Products VALUES 
('P004', 'Notebook', 'Stationery', 120),
('P007', 'Pen Set', 'Stationery', 250),
('P005', 'Headphones', 'Electronics', 3200),
('P003', 'Desk Chair', 'Furniture', 8500),
('P006', 'Standing Desk', 'Furniture', 22000);

INSERT INTO SalesReps VALUES 
('SR01', 'Deepak Joshi', 'deepak@corp.com', 'Mumbai HQ, Nariman Point, Mumbai - 400021'),
('SR02', 'Anita Desai', 'anita@corp.com', 'Delhi Office, Connaught Place, New Delhi - 110001'),
('SR03', 'Ravi Kumar', 'ravi@corp.com', 'South Zone, MG Road, Bangalore - 560001'),
('SR04', 'Sonia Malhotra', 'sonia@corp.com', 'West Office, Bandra, Mumbai - 400050'),
('SR05', 'Karan Johar', 'karan@corp.com', 'East Office, Salt Lake, Kolkata - 700091');

INSERT INTO Orders VALUES 
('ORD1027', 'C002', 'P004', 'SR02', 4, '2023-11-02'),
('ORD1114', 'C001', 'P007', 'SR01', 2, '2023-08-06'),
('ORD1153', 'C006', 'P007', 'SR01', 3, '2023-02-14'),
('ORD1002', 'C002', 'P005', 'SR02', 1, '2023-01-17'),
('ORD1118', 'C006', 'P007', 'SR02', 5, '2023-11-10');

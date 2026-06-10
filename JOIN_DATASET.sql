-- ============================================
-- CREATE TABLES
-- ============================================

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept VARCHAR(30),
    salary DECIMAL(10,2),
    city VARCHAR(30),
    hire_date DATE,
    manager_id INT
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(30),
    age INT,
    email VARCHAR(50),
    signup_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(10,2),
    stock INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    emp_id INT,
    region VARCHAR(30),
    amount DECIMAL(10,2),
    sale_date DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(employee_id)
);

-- ============================================
-- INSERT SAMPLE DATA
-- ============================================

-- Employees (7 employees, some with NULL manager_id)
INSERT INTO employees VALUES
(1, 'John Smith', 'IT', 75000, 'New York', '2020-01-15', NULL),
(2, 'Jane Doe', 'Sales', 65000, 'Chicago', '2019-03-20', 1),
(3, 'Mike Johnson', 'IT', 70000, 'San Francisco', '2021-06-10', 1),
(4, 'Sarah Williams', 'HR', 55000, 'Chicago', '2018-11-05', 5),
(5, 'Tom Brown', 'HR', 60000, 'Boston', '2017-02-28', NULL),
(6, 'Emily Davis', 'Sales', 62000, 'New York', '2020-09-12', 2),
(7, 'Chris Wilson', 'IT', 72000, 'Boston', '2022-01-03', 3);

-- Customers (6 customers)
INSERT INTO customers VALUES
(101, 'Alice Cooper', 'New York', 35, 'alice@email.com', '2021-01-10'),
(102, 'Bob Miller', 'Chicago', 42, 'bob@email.com', '2020-06-15'),
(103, 'Charlie Davis', 'Los Angeles', 28, 'charlie@email.com', '2022-03-20'),
(104, 'Diana Evans', 'Chicago', 55, 'diana@email.com', '2019-08-25'),
(105, 'Edward Ford', 'Boston', 38, 'edward@email.com', '2021-11-30'),
(106, 'Fiona Green', 'New York', 31, 'fiona@email.com', '2022-02-14');

-- Products (6 products)
INSERT INTO products VALUES
(1001, 'Laptop', 'Electronics', 999.99, 50),
(1002, 'Mouse', 'Electronics', 29.99, 200),
(1003, 'Keyboard', 'Electronics', 79.99, 150),
(1004, 'Desk', 'Furniture', 299.99, 30),
(1005, 'Chair', 'Furniture', 199.99, 45),
(1006, 'Monitor', 'Electronics', 349.99, 75);

-- Orders (8 orders with some NULL customer_id/product_id)
INSERT INTO orders VALUES
(5001, 101, 1001, 999.99, '2023-01-15', 'Delivered'),
(5002, 101, 1002, 29.99, '2023-01-20', 'Shipped'),
(5003, 102, 1004, 299.99, '2023-02-10', 'Delivered'),
(5004, 103, 1001, 999.99, '2023-02-25', 'Pending'),
(5005, 104, 1003, 79.99, '2023-03-05', 'Delivered'),
(5006, 105, 1005, 199.99, '2023-03-12', 'Shipped'),
(5007, 101, 1006, 349.99, '2023-03-18', 'Delivered'),
(5008, NULL, 1002, 29.99, '2023-04-01', 'Pending');  -- Order without customer

-- Sales (7 sales records, some with NULL emp_id)
INSERT INTO sales VALUES
(8001, 1, 'North', 15000.00, '2023-01-15'),
(8002, 2, 'East', 12000.00, '2023-02-10'),
(8003, 3, 'West', 18000.00, '2023-02-20'),
(8004, 4, 'South', 9000.00, '2023-03-05'),
(8005, 5, 'North', 11000.00, '2023-03-15'),
(8006, 2, 'East', 13500.00, '2023-04-01'),
(8007, NULL, 'West', 5000.00, '2023-04-10');  -- Sale without employee

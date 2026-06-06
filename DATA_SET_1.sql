50 question where you have to apply where ,group by ,having, order by, offset, limit and count.
CHECK IN SQL_PRCTICE

-- =====================
-- CREATE TABLES
-- =====================

CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    name TEXT,
    department TEXT,
    salary DECIMAL,
    city TEXT,
    hire_date DATE,
    manager_id INTEGER
);

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    name TEXT,
    city TEXT,
    age INTEGER,
    email TEXT,
    signup_date DATE
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    name TEXT,
    category TEXT,
    price DECIMAL,
    stock INTEGER
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    product_id INTEGER,
    amount DECIMAL,
    order_date DATE,
    status TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE sales (
    sale_id INTEGER PRIMARY KEY,
    emp_id INTEGER,
    region TEXT,
    amount DECIMAL,
    sale_date DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(employee_id)
);

-- =====================
-- INSERT EMPLOYEES
-- =====================

INSERT INTO employees VALUES (1,  'Alice',   'IT',        75000, 'Delhi',     '2019-03-15', NULL);
INSERT INTO employees VALUES (2,  'Bob',     'HR',        50000, 'Mumbai',    '2020-07-01', 1);
INSERT INTO employees VALUES (3,  'Charlie', 'IT',        80000, 'Delhi',     '2018-11-20', 1);
INSERT INTO employees VALUES (4,  'Diana',   'Finance',   60000, 'Bangalore', '2021-01-10', 1);
INSERT INTO employees VALUES (5,  'Eve',     'IT',        72000, 'Hyderabad', '2020-05-18', 3);
INSERT INTO employees VALUES (6,  'Frank',   'HR',        48000, 'Mumbai',    '2022-03-25', 2);
INSERT INTO employees VALUES (7,  'Grace',   'Finance',   65000, 'Delhi',     '2019-08-30', 4);
INSERT INTO employees VALUES (8,  'Henry',   'IT',        90000, 'Pune',      '2017-06-14', 3);
INSERT INTO employees VALUES (9,  'Ivy',     'Marketing', 55000, 'Chennai',   '2021-09-05', 1);
INSERT INTO employees VALUES (10, 'Jack',    'Marketing', 52000, 'Delhi',     '2022-11-11', 9);

-- =====================
-- INSERT CUSTOMERS
-- =====================

INSERT INTO customers VALUES (1,  'Rahul',   'Delhi',     28, 'rahul@email.com',   '2021-01-15');
INSERT INTO customers VALUES (2,  'Priya',   'Mumbai',    34, 'priya@email.com',   '2020-06-20');
INSERT INTO customers VALUES (3,  'Amit',    'Bangalore', 25, 'amit@email.com',    '2022-03-10');
INSERT INTO customers VALUES (4,  'Sneha',   'Hyderabad', 30, 'sneha@email.com',   '2021-07-18');
INSERT INTO customers VALUES (5,  'Vikram',  'Chennai',   45, 'vikram@email.com',  '2019-11-05');
INSERT INTO customers VALUES (6,  'Neha',    'Delhi',     22, 'neha@email.com',    '2023-01-22');
INSERT INTO customers VALUES (7,  'Rohan',   'Pune',      38, 'rohan@email.com',   '2020-09-14');
INSERT INTO customers VALUES (8,  'Kavya',   'Mumbai',    27, 'kavya@email.com',   '2022-08-30');
INSERT INTO customers VALUES (9,  'Arjun',   'Delhi',     31, 'arjun@email.com',   '2021-04-25');
INSERT INTO customers VALUES (10, 'Meena',   'Bangalore', 29, 'meena@email.com',   '2023-05-17');

-- =====================
-- INSERT PRODUCTS
-- =====================

INSERT INTO products VALUES (1,  'Laptop',      'Electronics',  55000, 30);
INSERT INTO products VALUES (2,  'Mouse',        'Electronics',   800,  150);
INSERT INTO products VALUES (3,  'Keyboard',     'Electronics',  1500,  100);
INSERT INTO products VALUES (4,  'Desk Chair',   'Furniture',    8000,  40);
INSERT INTO products VALUES (5,  'Monitor',      'Electronics', 18000,  60);
INSERT INTO products VALUES (6,  'Notebook',     'Stationery',    100,  500);
INSERT INTO products VALUES (7,  'Pen Set',      'Stationery',    250,  300);
INSERT INTO products VALUES (8,  'Standing Desk','Furniture',   22000,  20);
INSERT INTO products VALUES (9,  'Headphones',   'Electronics',  3500,  80);
INSERT INTO products VALUES (10, 'Webcam',       'Electronics',  2500,  70);

-- =====================
-- INSERT ORDERS
-- =====================

INSERT INTO orders VALUES (1,  1,  1,  55000, '2023-01-10', 'Delivered');
INSERT INTO orders VALUES (2,  2,  2,    800, '2023-02-14', 'Delivered');
INSERT INTO orders VALUES (3,  3,  5,  18000, '2023-03-05', 'Pending');
INSERT INTO orders VALUES (4,  4,  3,   1500, '2023-03-20', 'Delivered');
INSERT INTO orders VALUES (5,  5,  4,   8000, '2023-04-11', 'Cancelled');
INSERT INTO orders VALUES (6,  6,  9,   3500, '2023-05-08', 'Delivered');
INSERT INTO orders VALUES (7,  7,  1,  55000, '2023-05-22', 'Pending');
INSERT INTO orders VALUES (8,  8,  6,    100, '2023-06-15', 'Delivered');
INSERT INTO orders VALUES (9,  9,  10,  2500, '2023-07-03', 'Delivered');
INSERT INTO orders VALUES (10, 10, 8,  22000, '2023-07-19', 'Pending');
INSERT INTO orders VALUES (11, 1,  2,    800, '2023-08-01', 'Delivered');
INSERT INTO orders VALUES (12, 2,  5,  18000, '2023-08-15', 'Cancelled');
INSERT INTO orders VALUES (13, 3,  7,    250, '2023-09-10', 'Delivered');
INSERT INTO orders VALUES (14, 4,  1,  55000, '2023-09-25', 'Pending');
INSERT INTO orders VALUES (15, 5,  3,   1500, '2023-10-05', 'Delivered');

-- =====================
-- INSERT SALES
-- =====================

INSERT INTO sales VALUES (1,  1,  'North', 15000, '2023-01-05');
INSERT INTO sales VALUES (2,  2,  'South', 12000, '2023-01-18');
INSERT INTO sales VALUES (3,  3,  'East',  18000, '2023-02-10');
INSERT INTO sales VALUES (4,  5,  'West',  9000,  '2023-02-25');
INSERT INTO sales VALUES (5,  7,  'North', 21000, '2023-03-08');
INSERT INTO sales VALUES (6,  8,  'South', 25000, '2023-03-20');
INSERT INTO sales VALUES (7,  9,  'East',  11000, '2023-04-14');
INSERT INTO sales VALUES (8,  10, 'West',  8000,  '2023-04-28');
INSERT INTO sales VALUES (9,  1,  'North', 17000, '2023-05-10');
INSERT INTO sales VALUES (10, 3,  'East',  22000, '2023-05-22');
INSERT INTO sales VALUES (11, 5,  'South', 13000, '2023-06-05');
INSERT INTO sales VALUES (12, 8,  'West',  28000, '2023-06-18');
INSERT INTO sales VALUES (13, 9,  'North', 16000, '2023-07-01');
INSERT INTO sales VALUES (14, 2,  'East',  10000, '2023-07-15');
INSERT INTO sales VALUES (15, 7,  'South', 19000, '2023-08-03');

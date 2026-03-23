-- =========================
-- SCHEMA DESIGN (3NF)
-- =========================

-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- Sales Representatives Table
CREATE TABLE sales_reps (
    rep_id INT PRIMARY KEY,
    rep_name VARCHAR(100) NOT NULL
);

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT NOT NULL,
    rep_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (rep_id) REFERENCES sales_reps(rep_id)
);

-- Order Items Table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- =========================
-- INSERT SAMPLE DATA
-- =========================

-- Customers
INSERT INTO customers VALUES
(1, 'Amit', 'Mumbai'),
(2, 'Riya', 'Delhi'),
(3, 'Karan', 'Bangalore'),
(4, 'Neha', 'Pune'),
(5, 'Rahul', 'Chennai');

-- Products
INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 50000),
(2, 'Phone', 'Electronics', 20000),
(3, 'Shoes', 'Fashion', 3000),
(4, 'Watch', 'Accessories', 5000),
(5, 'Bag', 'Fashion', 2000);

-- Sales Reps
INSERT INTO sales_reps VALUES
(1, 'Raj'),
(2, 'Simran'),
(3, 'Arjun');

-- Orders
INSERT INTO orders VALUES
(1, '2024-01-01', 1, 1),
(2, '2024-01-02', 2, 2),
(3, '2024-01-03', 3, 1),
(4, '2024-01-04', 4, 3),
(5, '2024-01-05', 5, 2);

-- Order Items
INSERT INTO order_items VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 2, 3, 1),
(4, 3, 2, 1),
(5, 4, 4, 2);

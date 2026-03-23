-- ============================
-- STAR SCHEMA DESIGN (FINAL)
-- ============================

-- Dimension: Date
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE,
    day INT,
    month INT,
    year INT
);

-- Dimension: Store
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50)
);

-- Dimension: Product
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- Fact Table (Improved with unit_price)
CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    revenue DECIMAL(10,2),
    
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- ============================
-- INSERT CLEANED DATA
-- ============================

-- Dates (standard format)
INSERT INTO dim_date VALUES
(1, '2024-01-01', 1, 1, 2024),
(2, '2024-02-01', 1, 2, 2024),
(3, '2024-03-01', 1, 3, 2024);

-- Stores
INSERT INTO dim_store VALUES
(1, 'Store A', 'Mumbai'),
(2, 'Store B', 'Delhi'),
(3, 'Store C', 'Bangalore');

-- Products (standardized categories)
INSERT INTO dim_product VALUES
(1, 'Laptop', 'Electronics'),
(2, 'Shirt', 'Clothing'),
(3, 'Milk', 'Groceries');

-- Fact Sales (clean + consistent + 10 rows)
INSERT INTO fact_sales VALUES
(1, 1, 1, 1, 2, 50000, 100000),
(2, 1, 2, 2, 5, 1500, 7500),
(3, 1, 3, 3, 10, 60, 600),
(4, 2, 1, 2, 3, 1500, 4500),
(5, 2, 2, 1, 1, 50000, 50000),
(6, 2, 3, 3, 8, 60, 480),
(7, 3, 1, 3, 6, 60, 360),
(8, 3, 2, 2, 4, 1500, 6000),
(9, 3, 3, 1, 2, 50000, 100000),
(10, 1, 1, 2, 2, 1500, 3000);

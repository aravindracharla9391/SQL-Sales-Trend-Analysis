CREATE SCHEMA elevate_labs;

USE elevate_labs;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10, 2),
    product_id INT
);

INSERT INTO orders (order_id, order_date, amount, product_id) VALUES
(1001, '2024-11-05', 50.00, 101),
(1002, '2024-11-10', 120.50, 102),
(1003, '2024-11-10', 120.50, 102),
(1004, '2024-12-01', 75.25, 103),
(1005, '2024-12-15', 200.00, 104),
(1006, '2024-12-25', 10.00, 105);

SELECT
    EXTRACT(YEAR FROM order_date) AS sales_year,
    EXTRACT(MONTH FROM order_date) AS sales_month,
    SUM(amount) AS total_monthly_revenue,
    COUNT(DISTINCT order_id) AS total_monthly_orders
FROM
    orders
GROUP BY
    sales_year, sales_month
ORDER BY
    sales_year ASC, sales_month ASC;



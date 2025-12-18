USE sales_analysis;
CREATE TABLE IF NOT EXISTS orders (
    order_id INT,
    order_date DATE,
    product_id INT,
    amount DECIMAL(10,2)
);
TRUNCATE TABLE orders;
INSERT INTO orders (order_id, order_date, product_id, amount) VALUES
(1, '2023-01-05', 101, 250.00),
(2, '2023-01-15', 102, 180.00),
(3, '2023-02-10', 103, 300.00),
(4, '2023-02-18', 101, 150.00),
(5, '2023-03-01', 104, 400.00),
(6, '2023-03-12', 102, 220.00),
(7, '2023-04-05', 105, 500.00),
(8, '2023-04-22', 103, 350.00),
(9, '2023-05-10', 104, 600.00),
(10,'2023-05-28', 101, 200.00),
(11,'2023-06-03', 102, 450.00),
(12,'2023-06-18', 105, 700.00);
SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    order_year,
    order_month;
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS revenue
FROM orders
GROUP BY year, month
ORDER BY revenue DESC
LIMIT 3;


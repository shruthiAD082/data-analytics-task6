📊 Task 6 – Sales Trend Analysis Using Aggregations (MySQL)
📌 Objective

The objective of this task is to analyze monthly sales trends by calculating:

Monthly Revenue

Order Volume (number of orders per month)

This analysis helps in understanding how sales change over time using SQL aggregation functions.

🛠️ Tools & Technologies Used

MySQL

MySQL Workbench

📂 Dataset Description

A sample online sales dataset was used with the following columns:

Column Name	Description
order_id	Unique ID for each order
order_date	Date of the order
product_id	ID of the product
amount	Order amount (revenue)
🧩 Steps Performed
1️⃣ Selected Existing Database

The database was already available, so it was selected using:

USE sales_analysis;

2️⃣ Created Table Safely

The orders table was created using a safe method to avoid errors if the table already exists:

CREATE TABLE IF NOT EXISTS orders (
    order_id INT,
    order_date DATE,
    product_id INT,
    amount DECIMAL(10,2)
);

3️⃣ Cleaned Old Data

To ensure accurate results, old records were removed:

TRUNCATE TABLE orders;

4️⃣ Inserted Sample Data

Sample sales data was inserted into the table:

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

5️⃣ Main Analysis Query (Monthly Sales Trend)

Monthly revenue and order volume were calculated using aggregation functions:

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

6️⃣ Optional Analysis – Top 3 Months by Revenue

To find the highest-performing months:

SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS revenue
FROM orders
GROUP BY year, month
ORDER BY revenue DESC
LIMIT 3;

📈 Key SQL Concepts Used

GROUP BY

SUM()

COUNT(DISTINCT)

YEAR() and MONTH()

ORDER BY

LIMIT

TRUNCATE TABLE

✅ Outcome

Learned how to group data by time (month & year)

Analyzed sales trends using aggregation functions

Understood how to safely manage tables and clean data in MySQL

📸 Output

Screenshots of:

SQL queries

Result tables (monthly revenue & order volume)
are included in this repository.

🔗 Author

Shruthi Priya 
Data Analyst Intern

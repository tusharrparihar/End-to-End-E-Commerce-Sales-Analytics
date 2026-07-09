-- 1. Sales, Total Orders, Average Order Value (AOV)
SELECT
    ROUND(SUM(sales), 2) AS Total_Sales,
    COUNT(DISTINCT order_id) AS Total_Orders,
    ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS Average_Order_Value
FROM superstore;

-- 2. Sales and Order Volume by Month, Quarter, and Year
-- Monthly
SELECT
    YEAR(order_date) AS Year,
    MONTH(order_date) AS Month,
    ROUND(SUM(sales),2) AS Total_Sales,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM superstore
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY Year, Month;

-- Quarterly
SELECT
    YEAR(order_date) AS Year,
    QUARTER(order_date) AS Quarter,
    ROUND(SUM(sales),2) AS Total_Sales,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM superstore
GROUP BY YEAR(order_date), QUARTER(order_date)
ORDER BY Year, Quarter;

-- Yearly
SELECT
    YEAR(order_date) AS Year,
    ROUND(SUM(sales),2) AS Total_Sales,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM superstore
GROUP BY YEAR(order_date)
ORDER BY Year;

-- 3. Best-selling and Worst-selling Products & Categories
-- Products by Sales -- Best-selling
SELECT
    product_name,
    ROUND(SUM(sales),2) AS Total_Sales
FROM superstore
GROUP BY product_name
ORDER BY Total_Sales DESC;

-- Products by Sales -- Worst-selling
SELECT
    product_name,
    ROUND(SUM(sales),2) AS Total_Sales
FROM superstore
GROUP BY product_name
ORDER BY Total_Sales ASC;

-- Sub-Categories -- Best-selling
SELECT
    sub_category,
    ROUND(SUM(sales),2) AS Total_Sales
FROM superstore
GROUP BY sub_category
ORDER BY Total_Sales DESC;

-- Sub-Categories -- Worst-selling
SELECT
    sub_category,
    ROUND(SUM(sales),2) AS Total_Sales
FROM superstore
GROUP BY sub_category
ORDER BY Total_Sales ASC;

-- 4. Maximum and Minimum Sales by Region, State, City
-- Region
SELECT
    region,
    ROUND(SUM(sales),2) AS Total_Sales
FROM superstore
GROUP BY region
ORDER BY Total_Sales DESC;

-- State
SELECT
    state,
    ROUND(SUM(sales),2) AS Total_Sales
FROM superstore
GROUP BY state
ORDER BY Total_Sales DESC;

-- City
SELECT
    city,
    ROUND(SUM(sales),2) AS Total_Sales
FROM superstore
GROUP BY city
ORDER BY Total_Sales DESC;

-- 5. Biggest Customers by Sales
SELECT
    customer_id,
    customer_name,
    ROUND(SUM(sales),2) AS Total_Sales,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM superstore
GROUP BY customer_id, customer_name
ORDER BY Total_Sales DESC;

-- 6. Customer Purchase and Spending Behavior
SELECT
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS Total_Orders,
    ROUND(SUM(sales),2) AS Total_Spent,
    ROUND(AVG(sales),2) AS Average_Order_Value
FROM superstore
GROUP BY customer_id, customer_name
ORDER BY Total_Spent DESC;

-- Customer frequency
SELECT
    customer_name,
    COUNT(DISTINCT order_id) AS Order_Frequency
FROM superstore
GROUP BY customer_name
ORDER BY Order_Frequency DESC;

-- 7. Seasonal Sales Trends
-- Monthly trend
SELECT
    MONTHNAME(order_date) AS Month,
    MONTH(order_date) AS Month_No,
    ROUND(SUM(sales),2) AS Total_Sales,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM superstore
GROUP BY MONTHNAME(order_date), MONTH(order_date)
ORDER BY Month_No;

-- Quarterly trend
SELECT
    QUARTER(order_date) AS Quarter,
    ROUND(SUM(sales),2) AS Total_Sales,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM superstore
GROUP BY QUARTER(order_date)
ORDER BY Quarter;

-- 8. Top 10 High-Selling Products (Inventory Planning)
SELECT
    product_name,
    ROUND(SUM(sales),2) AS Total_Sales
FROM superstore
GROUP BY product_name
ORDER BY Total_Sales DESC
LIMIT 10;

-- 9. Slow-Moving Products
SELECT
    product_name,
    ROUND(SUM(sales),2) AS Total_Sales
FROM superstore
GROUP BY product_name
ORDER BY Total_Sales ASC
LIMIT 10;

-- 10. Top 5 Products with High Sales
SELECT
    product_name,
    ROUND(SUM(sales),2) AS Total_Sales
FROM superstore
GROUP BY product_name
ORDER BY Total_Sales DESC
LIMIT 5;

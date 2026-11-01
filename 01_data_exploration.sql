-- 01. Data Exploration

SELECT COUNT(*) AS row_count FROM superstore;
SELECT COUNT(DISTINCT `Order ID`) AS total_orders,
       COUNT(DISTINCT `Customer ID`) AS unique_customers,
       COUNT(DISTINCT `Product ID`) AS unique_products
FROM superstore;

SELECT * FROM superstore LIMIT 10;

SELECT
  SUM(Sales) AS total_sales,
  SUM(Profit) AS total_profit,
  SUM(Profit) / NULLIF(SUM(Sales), 0) AS profit_margin,
  AVG(Discount) AS average_discount,
  SUM(Quantity) AS units_sold
FROM superstore;

-- Check missing values in important columns
SELECT
  SUM(`Order ID` IS NULL OR `Order ID` = '') AS missing_order_ids,
  SUM(`Customer ID` IS NULL OR `Customer ID` = '') AS missing_customer_ids,
  SUM(`Product ID` IS NULL OR `Product ID` = '') AS missing_product_ids,
  SUM(Sales IS NULL) AS missing_sales,
  SUM(Profit IS NULL) AS missing_profit
FROM superstore;

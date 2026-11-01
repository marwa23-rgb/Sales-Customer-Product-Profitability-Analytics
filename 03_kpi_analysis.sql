-- 03. Overall KPI Analysis
SELECT
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit,
  ROUND(100 * SUM(profit) / NULLIF(SUM(sales), 0), 2) AS profit_margin_pct,
  COUNT(DISTINCT order_id) AS total_orders,
  COUNT(DISTINCT customer_id) AS unique_customers,
  SUM(quantity) AS units_sold,
  ROUND(SUM(sales) / NULLIF(COUNT(DISTINCT order_id), 0), 2) AS average_order_value
FROM vw_sales_clean;

-- Monthly sales and profit
SELECT YEAR(order_date) AS order_year,
       MONTH(order_date) AS order_month,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit,
       ROUND(100 * SUM(profit) / NULLIF(SUM(sales), 0), 2) AS margin_pct
FROM vw_sales_clean
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY order_year, order_month;

-- Year-over-year sales comparison
WITH yearly_sales AS (
  SELECT YEAR(order_date) AS sales_year, SUM(sales) AS total_sales
  FROM vw_sales_clean
  GROUP BY YEAR(order_date)
)
SELECT sales_year, ROUND(total_sales, 2) AS total_sales,
       ROUND(LAG(total_sales) OVER (ORDER BY sales_year), 2) AS previous_year_sales,
       ROUND(100 * (total_sales - LAG(total_sales) OVER (ORDER BY sales_year))
         / NULLIF(LAG(total_sales) OVER (ORDER BY sales_year), 0), 2) AS yoy_growth_pct
FROM yearly_sales
ORDER BY sales_year;

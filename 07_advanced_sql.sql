-- 07. Advanced Analysis: discounts, running totals and rankings

-- Profitability by discount band
SELECT discount_band,
       COUNT(*) AS order_lines,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit,
       ROUND(100 * SUM(profit) / NULLIF(SUM(sales), 0), 2) AS margin_pct
FROM vw_sales_clean
GROUP BY discount_band
ORDER BY discount_band;

-- Running monthly sales total
WITH monthly_sales AS (
  SELECT DATE_FORMAT(order_date, '%Y-%m-01') AS month_start,
         SUM(sales) AS total_sales
  FROM vw_sales_clean
  GROUP BY DATE_FORMAT(order_date, '%Y-%m-01')
)
SELECT month_start, ROUND(total_sales, 2) AS monthly_sales,
       ROUND(SUM(total_sales) OVER (ORDER BY month_start), 2) AS running_sales
FROM monthly_sales
ORDER BY month_start;

-- Compare each month's sales with the previous month
WITH monthly_sales AS (
  SELECT DATE_FORMAT(order_date, '%Y-%m-01') AS month_start,
         SUM(sales) AS total_sales
  FROM vw_sales_clean
  GROUP BY DATE_FORMAT(order_date, '%Y-%m-01')
)
SELECT month_start,
       ROUND(total_sales, 2) AS monthly_sales,
       ROUND(LAG(total_sales) OVER (ORDER BY month_start), 2) AS previous_month_sales
FROM monthly_sales
ORDER BY month_start;

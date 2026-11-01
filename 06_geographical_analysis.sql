-- 06. Geographic Performance
SELECT region, state, city,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit,
       ROUND(100 * SUM(profit) / NULLIF(SUM(sales), 0), 2) AS margin_pct
FROM vw_sales_clean
GROUP BY region, state, city
ORDER BY total_sales DESC;

SELECT region,
       COUNT(DISTINCT customer_id) AS customers,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit,
       ROUND(100 * SUM(profit) / NULLIF(SUM(sales), 0), 2) AS margin_pct
FROM vw_sales_clean
GROUP BY region
ORDER BY total_profit DESC;

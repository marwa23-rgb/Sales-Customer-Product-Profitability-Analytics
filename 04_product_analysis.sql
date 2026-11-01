-- 04. Product and Category Profitability
SELECT category, sub_category,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit,
       ROUND(100 * SUM(profit) / NULLIF(SUM(sales), 0), 2) AS margin_pct,
       SUM(quantity) AS units_sold
FROM vw_sales_clean
GROUP BY category, sub_category
ORDER BY total_profit DESC;

-- Lowest-margin sub-categories
SELECT sub_category,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit,
       ROUND(100 * SUM(profit) / NULLIF(SUM(sales), 0), 2) AS margin_pct
FROM vw_sales_clean
GROUP BY sub_category
ORDER BY margin_pct ASC
LIMIT 10;

-- Product ranking by profit within each category
WITH product_profit AS (
  SELECT category, product_id, product_name,
         SUM(sales) AS total_sales, SUM(profit) AS total_profit
  FROM vw_sales_clean
  GROUP BY category, product_id, product_name
)
SELECT *,
       DENSE_RANK() OVER (PARTITION BY category ORDER BY total_profit DESC) AS profit_rank
FROM product_profit;

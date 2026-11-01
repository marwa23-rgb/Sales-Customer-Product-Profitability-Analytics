-- 05. Customer Analysis
WITH customer_metrics AS (
  SELECT customer_id, customer_name, customer_segment,
         COUNT(DISTINCT order_id) AS order_count,
         SUM(sales) AS total_sales,
         SUM(profit) AS total_profit,
         MAX(order_date) AS last_order_date
  FROM vw_sales_clean
  GROUP BY customer_id, customer_name, customer_segment
)
SELECT *,
       ROUND(total_sales / NULLIF(order_count, 0), 2) AS avg_order_value,
       DENSE_RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
FROM customer_metrics
ORDER BY total_sales DESC;

-- Repeat customers
WITH customer_orders AS (
  SELECT customer_id, COUNT(DISTINCT order_id) AS order_count
  FROM vw_sales_clean
  GROUP BY customer_id
)
SELECT
  COUNT(*) AS customer_count,
  SUM(order_count > 1) AS repeat_customers,
  ROUND(100 * SUM(order_count > 1) / COUNT(*), 2) AS repeat_customer_pct
FROM customer_orders;

-- Customer segment performance
SELECT customer_segment,
       COUNT(DISTINCT customer_id) AS customers,
       COUNT(DISTINCT order_id) AS orders,
       ROUND(SUM(sales), 2) AS sales,
       ROUND(SUM(profit), 2) AS profit,
       ROUND(100 * SUM(profit) / NULLIF(SUM(sales), 0), 2) AS margin_pct
FROM vw_sales_clean
GROUP BY customer_segment
ORDER BY sales DESC;

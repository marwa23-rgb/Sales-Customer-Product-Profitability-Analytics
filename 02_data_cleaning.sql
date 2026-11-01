-- 02. Data Quality Checks
-- Keep the raw table unchanged; investigate these checks before modifying data.

-- Duplicate row IDs
SELECT `Row ID`, COUNT(*) AS occurrences
FROM superstore
GROUP BY `Row ID`
HAVING COUNT(*) > 1;

-- Invalid numeric values
SELECT *
FROM superstore
WHERE Sales < 0 OR Quantity <= 0 OR Discount < 0 OR Discount > 1;

-- Date range and parsing check (if dates were imported as text, use STR_TO_DATE)
SELECT MIN(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS first_order_date,
       MAX(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS last_order_date
FROM superstore;

-- Create an analysis view with standardized date fields.
CREATE OR REPLACE VIEW vw_sales_clean AS
SELECT
  `Row ID` AS row_id,
  `Order ID` AS order_id,
  STR_TO_DATE(`Order Date`, '%m/%d/%Y') AS order_date,
  STR_TO_DATE(`Ship Date`, '%m/%d/%Y') AS ship_date,
  `Ship Mode` AS ship_mode,
  `Customer ID` AS customer_id,
  `Customer Name` AS customer_name,
  Segment AS customer_segment,
  Country AS country,
  City AS city,
  State AS state,
  `Postal Code` AS postal_code,
  Region AS region,
  `Product ID` AS product_id,
  Category AS category,
  `Sub-Category` AS sub_category,
  `Product Name` AS product_name,
  Sales AS sales,
  Quantity AS quantity,
  Discount AS discount,
  Profit AS profit,
  CASE
    WHEN Discount >= 0.30 THEN '30%+'
    WHEN Discount >= 0.15 THEN '15%-29%'
    WHEN Discount > 0 THEN '1%-14%'
    ELSE 'No Discount'
  END AS discount_band,
  CASE WHEN Sales <> 0 THEN Profit / Sales ELSE NULL END AS profit_margin
FROM superstore;

# Sales, Customer & Product Profitability Analytics

An end-to-end retail analytics portfolio project using **MySQL** and **Power BI** to investigate sales performance, product profitability, customer behavior, discount effectiveness, and geographic trends.

## Business Problem
Understand revenue and profitability across products, categories, customers, regions, and time, then translate the findings into practical business recommendations.

## Dataset
`data/Sample - Superstore.csv` contains 9,994 order-line records and 21 columns, including order dates, customer and product details, sales, quantity, discount, and profit.

## Tools
- MySQL 8.0+ (CTEs, views, window functions, aggregations)
- Power BI Desktop (data modeling, DAX measures, interactive dashboards)
- GitHub (version control and project documentation)

## Repository Structure
- `data/`: source CSV dataset
- `sql/`: exploration, quality checks, analysis views, KPI and advanced analysis queries
- `powerbi/`: place the final `.pbix` file and dashboard screenshots here
- `insights/`: business findings and recommendations

## How to Run the SQL
1. Create a MySQL database, for example `superstore_analytics`.
2. Import `data/Sample - Superstore.csv` into a table named `superstore` using MySQL Workbench's Table Data Import Wizard.
3. Preserve the column names from the CSV. Set `Order Date` and `Ship Date` as text if the import wizard cannot parse the date format; the cleaning view converts them with `STR_TO_DATE`.
4. Run the scripts in numerical order from the `sql/` folder.
5. The scripts use MySQL 8.0+ syntax.

## Power BI Dashboard Plan
Build three report pages:
1. **Overview** — Total Sales, Total Profit, Profit Margin, Orders, monthly sales trend, sales by region and segment.
2. **Products** — Sales and profit by category/sub-category, product profitability ranking, discount band analysis, loss-making products.
3. **Customers & Geography** — customer segment performance, repeat-customer analysis, top customers, regional/state performance.

Suggested slicers: Order Date, Region, Segment, Category, and Ship Mode.

## Verified Baseline Findings
Calculated directly from the supplied CSV:
- Total Sales: **$2,297,200.86**
- Total Profit: **$286,397.02**
- Overall Profit Margin: **12.47%**
- Distinct Orders: **5,009**
- Distinct Customers: **793**
- Distinct Products: **1,862**
- Tables sub-category margin: **-8.56%**
- Margin for lines with discounts >= 30%: **-37.32%**
- Margin for lines with discounts < 30%: **21.80%**

## Business Recommendations
- Review discount policies, especially discounts of 30% and above.
- Investigate loss-making sub-categories such as Tables and Bookcases.
- Evaluate products using both sales volume and profit margin, not revenue alone.
- Use customer and regional performance to identify retention and growth opportunities.

## Project Status
- [x] Dataset inspected and baseline KPIs calculated
- [x] SQL scripts drafted
- [ ] Import and execute scripts in MySQL Workbench
- [ ] Build the three-page Power BI report
- [ ] Add dashboard screenshots and final `.pbix` file
- [ ] Update this README with final dashboard images and findings

> Note: The Power BI report is not included yet. Add your completed `.pbix` file under `powerbi/` after building it.

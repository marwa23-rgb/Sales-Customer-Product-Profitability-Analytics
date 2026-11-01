# Sales, Customer & Product Profitability Analytics

<p align="center">
  <img src="https://img.shields.io/badge/Retail-Analytics-8B72BE?style=for-the-badge" alt="Retail Analytics"/>
  <img src="https://img.shields.io/badge/SQL-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL"/>
  <img src="https://img.shields.io/badge/Power_BI-Dashboard-F2C811?style=for-the-badge&logo=powerbi&logoColor=black" alt="Power BI"/>
  <img src="https://img.shields.io/badge/Data_Analysis-Business_Insights-3776AB?style=for-the-badge" alt="Data Analysis"/>
</p>

## 📌 Project Overview

This project analyzes retail sales data to understand business performance across products, categories, customers, regions, and time.

The analysis focuses on identifying revenue and profitability trends, evaluating discount effectiveness, detecting loss-making products, and understanding customer purchasing behavior.

The workflow uses MySQL for data exploration, cleaning, aggregation, and advanced business analysis, with Power BI as the dashboard layer for interactive reporting and visualization.

## 🎯 Business Questions

- Which product categories and sub-categories generate the highest sales and profit?
- Which products have negative profit margins?
- How do discounts affect sales performance and profitability?
- Which customer segments generate the highest revenue and profit?
- Which regions and states contribute most to business performance?
- How does sales performance change over time?
- Who are the most valuable customers based on sales and profitability?
- Are high-revenue products necessarily the most profitable?

## 🧰 Tools & Skills

- **MySQL 8.0+:** data exploration, aggregations, joins, CTEs, views, subqueries, window functions, and KPI calculations.
- **Power BI:** data modeling, DAX measures, interactive dashboards, and business performance reporting.
- **Data Analysis:** profitability analysis, customer segmentation, discount analysis, and trend analysis.
- **Data Quality:** missing-value checks, duplicate detection, data type validation, and date formatting.
- **Business Intelligence:** KPI monitoring, performance comparisons, and actionable recommendations.

## 🔎 Dataset & Data Quality

Dataset: `Sample - Superstore.csv`

- **Rows:** 9,994 order-line records
- **Columns:** 21
- **Distinct Orders:** 5,009
- **Distinct Customers:** 793
- **Distinct Products:** 1,862
- **Key Fields:** Order Date, Ship Date, Customer, Segment, Region, Category, Sub-Category, Sales, Quantity, Discount, and Profit.

## 📊 Headline Results

Values calculated directly from the supplied dataset.

| KPI | Result |
|---|---:|
| Total Sales | $2,297,200.86 |
| Total Profit | $286,397.02 |
| Overall Profit Margin | 12.47% |
| Distinct Orders | 5,009 |
| Distinct Customers | 793 |
| Distinct Products | 1,862 |
| Tables Sub-category Profit Margin | -8.56% |
| Margin with Discounts >= 30% | -37.32% |
| Margin with Discounts < 30% | 21.80% |

### Discount Performance Comparison

| Discount Group | Profit Margin |
|---|---:|
| Discounts >= 30% | -37.32% |
| Discounts < 30% | 21.80% |

### Product Profitability

- The Tables sub-category has a negative profit margin of **-8.56%**.
- High-discount order lines (30% or more) have a negative profit margin of **-37.32%**.
- Order lines with discounts below 30% have a positive profit margin of **21.80%**.

## 💡 Key Insights

- **Overall profitability:** The business generated approximately $2.30M in sales and $286.40K in profit, achieving a 12.47% overall profit margin.
- **Discount impact:** Order lines with discounts of 30% or more recorded a negative profit margin of -37.32%, compared with 21.80% for lower-discount lines.
- **Loss-making category:** Tables recorded a negative sub-category profit margin of -8.56%, indicating a need for further investigation.
- **Revenue vs. profitability:** High sales do not necessarily indicate strong financial performance; product decisions should consider profit and margin.
- **Customer opportunities:** Customer segmentation and purchasing behavior can help identify valuable customers and potential retention opportunities.

## 📈 Recommended Dashboard Pages

1. **Executive Overview:** Total Sales, Total Profit, Profit Margin, Orders, Customers, monthly sales trends, and regional performance.
2. **Product Performance:** Sales and profit by category and sub-category, product profitability rankings, discount analysis, and loss-making products.
3. **Customer & Geographic Analysis:** Customer segment performance, top customers, repeat-customer analysis, and regional/state performance.

**Suggested Slicers:**
- Order Date
- Region
- Segment
- Category
- Ship Mode

## 🧠 Business Recommendations

- Review discount policies, especially discounts of 30% and above, to reduce potential profitability losses.
- Investigate the cost structure, pricing, and discount distribution behind the negative profitability of Tables.
- Evaluate products using sales volume, total profit, and profit margin rather than revenue alone.
- Identify high-value customers and develop targeted retention strategies.
- Compare regional and state performance using both sales and profit to identify sustainable growth opportunities.
- Monitor profit margins regularly to identify declining product and category performance.

## ⚠️ Metric Definitions

- **Total Sales:** Sum of all sales transactions.
- **Total Profit:** Sum of profit across all order lines.
- **Profit Margin:** Total Profit / Total Sales × 100.
- **Average Order Value (AOV):** Total Sales / Distinct Orders.
- **Customer Sales:** Total sales generated by each customer.
- **Discount Impact:** Comparison of profitability across discount groups.

## 📁 Repository Structure

```text
Sales-Customer-Product-Profitability-Analytics/
│
├── data/
│   └── Sample - Superstore.csv
│
├── sql/
│   ├── 01_data_exploration.sql
│   ├── 02_data_quality_checks.sql
│   ├── 03_data_cleaning.sql
│   ├── 04_analysis_views.sql
│   ├── 05_kpi_analysis.sql
│   └── 06_advanced_analysis.sql
│
├── powerbi/
│   └── dashboard screenshots and .pbix
│
├── insights/
│   └── business_insights.md
│
└── README.md
```

## ⚙️ How to Run the Project

1. Create a MySQL database named `superstore_analytics`.
2. Import `data/Sample - Superstore.csv` into a table named `superstore` using MySQL Workbench.
3. Preserve the original CSV column names.
4. If necessary, import date columns as text and convert them using `STR_TO_DATE`.
5. Execute SQL scripts in numerical order.
6. Connect Power BI Desktop to the analyzed MySQL data.
7. Build the dashboard pages and save the final `.pbix` file inside `powerbi/`.

## 🚧 Project Status

- [x] Dataset inspection and baseline KPI calculations
- [x] Initial business findings and recommendations
- [x] SQL scripts drafted
- [ ] Execute and validate all SQL scripts in MySQL Workbench
- [ ] Build interactive Power BI dashboards
- [ ] Add dashboard screenshots
- [ ] Upload the final `.pbix` file
- [ ] Finalize project documentation

> **Note:** The Power BI dashboard is not included yet. The project is still in progress until the report is completed and uploaded.

## 👩‍💻 Author

**Marwa Samy** · [GitHub](https://github.com/marwa23-rgb)

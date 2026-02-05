# Business Analytics SQL KPIs (BigQuery)

A clean KPI portfolio project built in **Google BigQuery** using the public dataset:
`bigquery-public-data.thelook_ecommerce` (e-commerce orders + products).

## Dataset
- **Source:** Google BigQuery Public Datasets  
- **Tables used:** `order_items`, `orders`, `products` (as needed)

## KPIs Built (SQL)
1. **Top Products by Revenue**  
   - Ranks products by total revenue, includes items sold + avg item price.

2. **Category Performance**  
   - Category-level revenue, orders, items sold, AOV, avg item price.

3. **Monthly Top-5 Category Trend**  
   - Tracks top categories by month (revenue + orders).

4. **Top-5 Category Revenue Share (%)**  
   - Computes each top category’s share of total monthly revenue.

5. **Repeat Customer Rate (Monthly Retention)**  
   - Monthly customers vs repeat customers and repeat rate %.

6. **Monthly Revenue Trend**  
   - Monthly revenue, orders, and AOV.

7. **MoM Revenue Growth (%)**  
   - Month-over-month revenue growth using window functions.

## Notes / Quick Checks
- Revenue share calculations use `NULLIF()` to avoid divide-by-zero.
- MoM growth uses `LAG()` and returns `NULL` for the first month.

## How to Run
1. Open **BigQuery → SQL Workspace**
2. Paste any query
3. Click **Run**
4. (Optional) Export results as CSV from **Query results**

## Tools
- Google BigQuery (SQL)
- Public dataset: `thelook_ecommerce`

---
**Author:** Tanya Sharma

# Business Analytics SQL KPIs (BigQuery)

This project analyzes ecommerce performance using SQL in Google BigQuery on the public dataset:
`bigquery-public-data.thelook_ecommerce`.

## KPIs Included
Click any KPI to view the SQL:

- [04_repeat_customer_rate_monthly](sql/04_repeat_customer_rate_monthly.sql)
- [05_top_products_by_revenue](sql/05_top_products_by_revenue.sql)
- [06_category_performance](sql/06_category_performance.sql)
- [07_monthly_top5_category_trend](sql/07_monthly_top5_category_trend.sql)
- [08_top5_category_revenue_share](sql/08_top5_category_revenue_share.sql)
- [08_top5_category_revenue_share_pct](sql/08_top5_category_revenue_share_pct.sql)
- [08_qc2_top5_share_sum_check](sql/08_qc2_top5_share_sum_check.sql)
- [09_repeat_customer_rate_monthly](sql/09_repeat_customer_rate_monthly.sql)
- [10_monthly_revenue_trend](sql/10_monthly_revenue_trend.sql)
- [11_mom_revenue_growth_pct](sql/11_mom_revenue_growth_pct.sql)

## Tools
- Google BigQuery
- SQL

## Notes
- Dataset: `bigquery-public-data.thelook_ecommerce`
- Time grain: Monthly KPIs using `DATE_TRUNC(date, MONTH)`

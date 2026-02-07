-- QC2: Sum of revenue_share_pct across Top-5 rows per month
WITH cat_month AS (
  SELECT
    DATE_TRUNC(DATE(oi.created_at), MONTH) AS month,
    p.category,
    SUM(oi.sale_price) AS category_revenue
  FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
  JOIN `bigquery-public-data.thelook_ecommerce.products` p
    ON oi.product_id = p.id
  GROUP BY 1, 2
),
top5 AS (
  SELECT category
  FROM cat_month
  GROUP BY 1
  ORDER BY SUM(category_revenue) DESC
  LIMIT 5
),
top5_month AS (
  SELECT *
  FROM cat_month
  WHERE category IN (SELECT category FROM top5)
),
month_total AS (
  SELECT
    month,
    SUM(category_revenue) AS total_revenue
  FROM cat_month
  GROUP BY 1
),
detail AS (
  SELECT
    t.month,
    t.category,
    ROUND(100 * t.category_revenue / NULLIF(m.total_revenue, 0), 2) AS revenue_share_pct
  FROM top5_month t
  JOIN month_total m
  USING (month)
)
SELECT
  month,
  COUNT(*) AS rows_in_month,
  ROUND(SUM(revenue_share_pct), 2) AS sum_revenue_share_pct
FROM detail
GROUP BY month
ORDER BY month;

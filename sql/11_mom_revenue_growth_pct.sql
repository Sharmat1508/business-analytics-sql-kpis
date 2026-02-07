WITH m AS (
  SELECT
    DATE_TRUNC(DATE(created_at), MONTH) AS month,
    SUM(sale_price) AS revenue
  FROM `bigquery-public-data.thelook_ecommerce.order_items`
  GROUP BY 1
)
SELECT
  month,
  ROUND(revenue, 2) AS revenue,
  ROUND(
    100 * (revenue - LAG(revenue) OVER (ORDER BY month))
    / NULLIF(LAG(revenue) OVER (ORDER BY month), 0),
    2
  ) AS mom_growth_pct
FROM m
ORDER BY month;

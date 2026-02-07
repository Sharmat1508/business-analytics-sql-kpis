SELECT
  DATE_TRUNC(DATE(created_at), MONTH) AS month,
  ROUND(SUM(sale_price), 2) AS revenue,
  COUNT(DISTINCT order_id) AS orders,
  ROUND(SUM(sale_price) / NULLIF(COUNT(DISTINCT order_id), 0), 2) AS aov
FROM `bigquery-public-data.thelook_ecommerce.order_items`
GROUP BY 1
ORDER BY month;

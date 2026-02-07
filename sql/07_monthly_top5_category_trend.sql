WITH cat_month AS (
  SELECT
    DATE_TRUNC(DATE(oi.created_at), MONTH) AS month,
    p.category,
    ROUND(SUM(oi.sale_price), 2) AS revenue,
    COUNT(DISTINCT oi.order_id) AS orders
  FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
  JOIN `bigquery-public-data.thelook_ecommerce.products` p
    ON oi.product_id = p.id
  GROUP BY 1, 2
),
top5 AS (
  SELECT category
  FROM cat_month
  GROUP BY 1
  ORDER BY SUM(revenue) DESC
  LIMIT 5
)
SELECT
  month,
  category,
  revenue,
  orders
FROM cat_month
WHERE category IN (SELECT category FROM top5)
ORDER BY month, revenue DESC;

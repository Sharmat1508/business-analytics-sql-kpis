SELECT
  p.category,
  COUNT(*) AS items_sold,
  COUNT(DISTINCT oi.order_id) AS orders,
  ROUND(SUM(oi.sale_price), 2) AS revenue,
  ROUND(SUM(oi.sale_price) / NULLIF(COUNT(DISTINCT oi.order_id), 0), 2) AS aov,
  ROUND(AVG(oi.sale_price), 2) AS avg_item_price
FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
JOIN `bigquery-public-data.thelook_ecommerce.products` p
  ON oi.product_id = p.id
GROUP BY 1
ORDER BY revenue DESC;

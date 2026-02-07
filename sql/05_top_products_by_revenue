SELECT
  oi.product_id,
  p.name AS product_name,
  p.category,
  COUNT(*) AS items_sold,
  ROUND(SUM(oi.sale_price), 2) AS revenue,
  ROUND(AVG(oi.sale_price), 2) AS avg_item_price
FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
JOIN `bigquery-public-data.thelook_ecommerce.products` p
  ON oi.product_id = p.id
GROUP BY 1,2,3
ORDER BY revenue DESC
LIMIT 20;

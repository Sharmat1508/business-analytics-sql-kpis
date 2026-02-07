WITH first_purchase AS (
  SELECT
    user_id,
    DATE_TRUNC(MIN(DATE(created_at)), MONTH) AS first_month
  FROM `bigquery-public-data.thelook_ecommerce.order_items`
  GROUP BY 1
),
monthly_customers AS (
  SELECT
    DATE_TRUNC(DATE(oi.created_at), MONTH) AS month,
    oi.user_id
  FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
  GROUP BY 1, 2
)
SELECT
  mc.month,
  COUNT(DISTINCT mc.user_id) AS customers,
  COUNT(DISTINCT IF(fp.first_month < mc.month, mc.user_id, NULL)) AS repeat_customers,
  ROUND(
    100 * COUNT(DISTINCT IF(fp.first_month < mc.month, mc.user_id, NULL))
    / NULLIF(COUNT(DISTINCT mc.user_id), 0),
  2) AS repeat_customer_rate_pct
FROM monthly_customers mc
JOIN first_purchase fp
  ON mc.user_id = fp.user_id
GROUP BY 1
ORDER BY 1;

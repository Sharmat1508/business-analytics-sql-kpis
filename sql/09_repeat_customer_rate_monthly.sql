WITH monthly_user_orders AS (
  SELECT
    DATE_TRUNC(DATE(created_at), MONTH) AS month,
    user_id
  FROM `bigquery-public-data.thelook_ecommerce.order_items`
  GROUP BY 1, 2
),
user_first_month AS (
  SELECT
    user_id,
    MIN(month) AS first_month
  FROM monthly_user_orders
  GROUP BY 1
),
monthly_stats AS (
  SELECT
    m.month,
    COUNT(DISTINCT m.user_id) AS customers,
    COUNT(DISTINCT IF(m.month > f.first_month, m.user_id, NULL)) AS repeat_customers
  FROM monthly_user_orders m
  JOIN user_first_month f
    USING (user_id)
  GROUP BY 1
)

SELECT
  month,
  customers,
  repeat_customers,
  ROUND(100 * repeat_customers / NULLIF(customers, 0), 2) AS repeat_customer_rate_pct
FROM monthly_stats
ORDER BY month;

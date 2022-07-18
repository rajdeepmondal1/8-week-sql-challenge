-- 2. How many unique customer orders were made?
SELECT COUNT(DISTINCT order_id)
FROM t_customer_orders;
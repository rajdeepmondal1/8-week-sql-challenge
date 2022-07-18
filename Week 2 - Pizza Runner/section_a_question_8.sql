-- 8. How many pizzas were delivered that had both exclusions and extras?
SELECT COUNT(*)
FROM t_customer_orders
JOIN t_runner_orders
    ON t_customer_orders.order_id = t_runner_orders.order_id
WHERE cancellation = ''
  AND exclusions != ''
  AND extras != '';
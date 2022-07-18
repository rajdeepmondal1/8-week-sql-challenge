-- 6. What was the maximum number of pizzas delivered in a single order?
WITH pizza_counts AS (
  SELECT t_customer_orders.order_id,
         COUNT(*) AS pizza_count
  FROM t_customer_orders
  JOIN t_runner_orders
      ON t_customer_orders.order_id = t_runner_orders.order_id
  WHERE cancellation = ''
  GROUP BY t_customer_orders.order_id
  ORDER BY t_customer_orders.order_id)
SELECT MAX(pizza_count) as max_pizza_delivered
FROM pizza_counts;
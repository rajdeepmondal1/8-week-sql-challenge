-- 3. Is there any relationship between the number of pizzas and how long the order takes to prepare?
WITH temp_view AS (
  SELECT COUNT(pizza_id) AS pizza_count,
         pickup_time - order_time AS time_per_order
  FROM t_customer_orders
  JOIN t_runner_orders
      ON t_customer_orders.order_id = t_runner_orders.order_id
  WHERE cancellation = ''
  GROUP BY pickup_time, order_time
  )
SELECT pizza_count,
       TO_CHAR(AVG(time_per_order), 'MI') AS avg_time
FROM temp_view
GROUP BY pizza_count
ORDER BY pizza_count;
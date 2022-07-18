-- 4. How many of each type of pizza was delivered?
SELECT pizza_runner.pizza_names.pizza_name,
       COUNT(*) AS pizza_count
FROM t_customer_orders
JOIN t_runner_orders
    ON t_customer_orders.order_id = t_runner_orders.order_id
JOIN pizza_runner.pizza_names
    ON t_customer_orders.pizza_id = pizza_runner.pizza_names.pizza_id
WHERE cancellation =''
GROUP BY t_customer_orders.pizza_id, pizza_runner.pizza_names.pizza_name
ORDER BY t_customer_orders.pizza_id;
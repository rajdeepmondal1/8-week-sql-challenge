-- 5. How many Vegetarian and Meat lovers were ordered by each customer?
SELECT customer_id, pizza_name,
       COUNT(*) AS order_count
FROM t_customer_orders
JOIN t_runner_orders
    ON t_customer_orders.order_id = t_runner_orders.order_id
JOIN pizza_runner.pizza_names
    ON t_customer_orders.pizza_id = pizza_runner.pizza_names.pizza_id
GROUP BY customer_id, pizza_name
ORDER BY customer_id, pizza_name;
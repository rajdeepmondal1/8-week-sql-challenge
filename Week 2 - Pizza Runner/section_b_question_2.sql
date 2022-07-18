-- 2. What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?
WITH times_per_order AS (
    SELECT runner_id,
           pickup_time - order_time AS time_per_order
    FROM t_customer_orders
    LEFT JOIN t_runner_orders
        ON t_customer_orders.order_id = t_runner_orders.order_id
)
SELECT runner_id,
       TO_CHAR(AVG(time_per_order), 'MI') AS avg_time
FROM times_per_order
GROUP BY runner_id
ORDER BY runner_id;
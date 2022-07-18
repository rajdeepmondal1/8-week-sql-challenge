-- 4. What was the average distance travelled for each customer?
SELECT customer_id,
       AVG(distance) AS avg_distance
FROM t_runner_orders
JOIN t_customer_orders
    ON t_customer_orders.order_id = t_runner_orders.order_id
WHERE cancellation = ''
GROUP BY customer_id
ORDER BY customer_id;
-- 7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
SELECT customer_id,
	SUM(CASE
    	WHEN exclusions != '' OR extras != '' THEN 1
        ELSE 0
        END) AS at_least_1_change,
	SUM(CASE
    	WHEN exclusions = '' AND extras = '' THEN 1
        ELSE 0
        END) AS no_changes
FROM t_customer_orders
JOIN t_runner_orders
    ON t_customer_orders.order_id = t_runner_orders.order_id
WHERE cancellation = ''
GROUP BY customer_id;
-- 5. What was the difference between the longest and shortest delivery times for all orders?
SELECT MAX(duration)-MIN(duration) AS difference
FROM t_runner_orders
WHERE cancellation = '';
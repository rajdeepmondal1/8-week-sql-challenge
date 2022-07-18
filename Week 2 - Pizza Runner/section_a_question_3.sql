-- 3. How many successful orders were delivered by each runner?
SELECT runner_id,
       COUNT(*)
FROM t_runner_orders
WHERE cancellation = ''
GROUP BY runner_id;
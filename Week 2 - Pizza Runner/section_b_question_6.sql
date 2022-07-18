-- 6. What was the average speed for each runner for each delivery and do you notice any trend for these values?
SELECT runner_id,
       order_id,
       60*(distance/duration) AS speed
FROM t_runner_orders
WHERE distance != 0
  AND duration != 0
GROUP BY runner_id, order_id, distance, duration
ORDER BY runner_id, order_id;
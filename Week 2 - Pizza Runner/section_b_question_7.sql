-- 7. What is the successful delivery percentage for each runner?
SELECT runner_id,
	ROUND(100 * SUM(CASE
	                    WHEN cancellation = '' THEN 1
                        ELSE 0
                        END
	    ) / COUNT(*), 0) AS percentage
FROM t_runner_orders
GROUP BY runner_id
ORDER BY runner_id;
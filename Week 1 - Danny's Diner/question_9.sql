-- 9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
WITH temp_view AS (
  SELECT
      sales.customer_id,
  CASE
      WHEN sales.product_id = 1 THEN SUM(price*20)
      ELSE SUM(price*10)
  END AS points
  FROM sales
  JOIN menu
  ON menu.product_id = sales.product_id
  GROUP BY sales.customer_id, sales.product_id
)
SELECT
	customer_id,
    SUM(points) as reward_points
FROM temp_view
GROUP BY customer_id
ORDER BY customer_id;
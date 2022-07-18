-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
WITH temp_view AS (
  SELECT
      sales.customer_id,
  CASE
      WHEN order_date BETWEEN join_date AND join_date + INTERVAL '6 day' THEN SUM(price*20)
      ELSE SUM(price*10)
  END AS points
  FROM sales
  JOIN menu
  ON menu.product_id = sales.product_id
  JOIN members
  ON sales.customer_id = members.customer_id
  GROUP BY sales.customer_id, order_date, join_date
)
SELECT
	customer_id,
    SUM(points) as reward_points
FROM temp_view
GROUP BY customer_id
ORDER BY customer_id;
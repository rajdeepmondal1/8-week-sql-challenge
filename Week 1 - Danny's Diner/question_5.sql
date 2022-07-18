-- 5. Which item was the most popular for each customer?
WITH temp_view AS (
  SELECT
    customer_id,
    product_name,
  	DENSE_RANK() OVER(PARTITION BY customer_id ORDER BY COUNT(menu.product_id) DESC) AS rank
  FROM sales
  JOIN menu
  ON sales.product_id = menu.product_id
  GROUP BY customer_id, menu.product_name
  ORDER BY customer_id
)
SELECT
	customer_id,
    product_name
FROM temp_view
WHERE rank = 1;
-- 7. Which item was purchased just before the customer became a member?
WITH temp_view AS (
  SELECT
	sales.customer_id,
    menu.product_name,
    order_date,
    join_date,
  	DENSE_RANK() OVER(PARTITION BY sales.customer_id ORDER BY order_date DESC) AS rank
	FROM sales
    JOIN menu
    ON menu.product_id = sales.product_id
	JOIN members
	ON sales.customer_id = members.customer_id
	WHERE join_date > order_date
    ORDER BY customer_id, order_date
)
SELECT
	customer_id,
	product_name
FROM temp_view
where rank = 1;
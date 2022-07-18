-- 3. What was the first item from the menu purchased by each customer?
WITH temp_view AS (
  SELECT
  *,
  ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS row_number
  FROM sales
)
SELECT
	customer_id,
    product_name
FROM temp_view
JOIN menu
ON temp_view.product_id = menu.product_id
WHERE row_number = 1;
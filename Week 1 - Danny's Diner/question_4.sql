-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
SELECT
	product_name,
	COUNT(menu.product_id) AS times_purchased
FROM sales
JOIN menu
ON menu.product_id = sales.product_id
GROUP BY product_name
ORDER BY times_purchased DESC
LIMIT 1;
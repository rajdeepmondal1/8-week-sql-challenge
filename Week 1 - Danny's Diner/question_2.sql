-- 2. How many days has each customer visited the restaurant?
SELECT
	customer_id,
    COUNT(DISTINCT order_date) AS days
FROM sales
JOIN menu
ON menu.product_id = sales.product_id
GROUP BY customer_id
ORDER BY customer_id;
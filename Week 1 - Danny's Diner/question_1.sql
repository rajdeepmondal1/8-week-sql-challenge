-- 1. What is the total amount each customer spent at the restaurant?
SELECT
	customer_id,
    SUM(price) AS total_amount
FROM sales
JOIN menu
ON menu.product_id = sales.product_id
GROUP BY customer_id
ORDER BY customer_id;
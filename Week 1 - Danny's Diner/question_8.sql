-- 8. What is the total items and amount spent for each member before they became a member?
SELECT
	sales.customer_id,
    count(sales.product_id) AS total_items,
    SUM(price) AS total_amount
FROM sales
JOIN menu
ON menu.product_id = sales.product_id
JOIN members
ON sales.customer_id = members.customer_id
WHERE join_date > order_date
GROUP BY sales.customer_id
ORDER BY sales.customer_id;
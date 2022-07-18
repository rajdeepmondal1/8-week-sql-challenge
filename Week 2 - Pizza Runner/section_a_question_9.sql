-- 9. What was the total volume of pizzas ordered for each hour of the day?
SELECT EXTRACT(hour FROM order_time) AS order_hour,
       COUNT(*)
FROM t_customer_orders
GROUP BY order_hour
ORDER BY order_hour;
-- 10. What was the volume of orders for each day of the week?
SELECT EXTRACT(dow FROM order_time) AS order_dow,
       COUNT(*)
FROM t_customer_orders
GROUP BY order_dow
ORDER BY order_dow;
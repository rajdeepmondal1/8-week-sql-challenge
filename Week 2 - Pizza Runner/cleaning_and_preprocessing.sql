--PREPROCESSING AND CLEANUP OF DATA
--Clean customer_orders Table to remove NULL
SELECT order_id, customer_id, pizza_id,
  CASE
    WHEN exclusions IS null OR exclusions LIKE 'null' THEN ''
    ELSE exclusions
    END AS exclusions,
  CASE
    WHEN extras IS NULL or extras LIKE 'null' THEN ''
    ELSE extras
    END AS extras,
  order_time
INTO t_customer_orders
FROM pizza_runner.customer_orders;

--Clean runner_orders Table to remove null
SELECT order_id, runner_id,
	CASE
      WHEN pickup_time LIKE 'null' THEN null
      ELSE pickup_time
      END AS pickup_time,
    CASE
      WHEN distance LIKE 'null' THEN '0'
      WHEN distance LIKE '%km%' THEN TRIM(distance, 'km')
      ELSE distance
      END AS distance,
    CASE
      WHEN duration LIKE 'null' THEN '0'
      WHEN duration LIKE '%minutes%' THEN TRIM(duration, 'minutes')
      WHEN duration LIKE '%minute%' THEN TRIM(duration, 'minute')
      WHEN duration LIKE '%mins%' THEN TRIM (duration, 'mins')
      ELSE duration
      END AS duration,
    CASE
      WHEN cancellation IS null OR cancellation LIKE 'null' THEN ''
      ELSE cancellation
      END AS cancellation
INTO t_runner_orders
FROM pizza_runner.runner_orders;

ALTER TABLE t_runner_orders
ALTER COLUMN pickup_time TYPE TIMESTAMP USING pickup_time::timestamp,
ALTER COLUMN distance TYPE FLOAT USING distance::float,
ALTER COLUMN duration TYPE INT USING duration::int;
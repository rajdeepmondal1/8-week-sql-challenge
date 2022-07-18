-- 1. How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)
SELECT TO_CHAR(registration_date, 'WW') AS registration_week,
       COUNT(*)
FROM pizza_runner.runners
GROUP BY registration_week
ORDER BY registration_week;
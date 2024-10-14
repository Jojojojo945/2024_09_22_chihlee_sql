SELECT *
FROM public.payment
ORDER BY payment_id ASC;

SELECT customer_id
FROM payment
GROUP BY customer_id
ORDER BY customer_id ASC;

SELECT customer_id,
	   SUM(amount) AS 加總,
	   AVG(amount) AS 平均數量,
	   COUNT(amount) AS 筆數,
	   MAX(amount) AS 最大,
	   MIN(amount) AS 最小
FROM payment
GROUP BY customer_id
ORDER BY customer_id ASC;

SELECT customer_id,
	   SUM(amount) AS 加總,
	   AVG(amount) AS 平均數量,
	   COUNT(amount) AS 筆數,
	   MAX(amount) AS 最大,
	   MIN(amount) AS 最小
FROM payment
GROUP BY customer_id
ORDER BY COUNT(amount) ASC;

SELECT customer_id,
	   SUM(amount) AS 加總,
	   AVG(amount) AS 平均數量,
	   COUNT(amount) AS 筆數,
	   MAX(amount) AS 最大,
	   MIN(amount) AS 最小
FROM payment
GROUP BY customer_id
ORDER BY 筆數 ASC;

SELECT * 
FROM payment p JOIN customer c ON p.customer_id = c.customer_id;

SELECT (first_name || ' ' || last_name) AS full_name/*字串連結用兩個直綫*/ 
FROM payment p JOIN customer c ON p.customer_id = c.customer_id;

SELECT (first_name || ' ' || last_name) AS full_name 
FROM payment p JOIN customer c ON p.customer_id = c.customer_id
GROUP BY full_name;

SELECT (first_name || ' ' || last_name) AS full_name,SUM(amount)
FROM payment p JOIN customer c ON p.customer_id = c.customer_id
GROUP BY full_name;

SELECT (first_name || ' ' || last_name) AS full_name,SUM(amount) AS 總和
FROM payment p JOIN customer c ON p.customer_id = c.customer_id
GROUP BY full_name
ORDER BY 總和 DESC;
SELECT *
FROM payment;

SELECT customer_id, SUM(amount) AS 總和
FROM payment
GROUP BY customer_id
HAVING SUM(amount) >200;
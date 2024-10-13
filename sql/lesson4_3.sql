SELECT *
FROM public.payment
ORDER BY payment_id ASC;

SELECT customer_id
FROM payment
GROUP BY customer_id
ORDER BY customer_id ASC;
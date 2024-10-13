SELECT *
FROM customer;

SELECT *
FROM customer
WHERE first_name = 'Jamie';

SELECT *
FROM customer
WHERE first_name = 'Jamie' AND last_name = 'Rice';

SELECT *
FROM customer
WHERE first_name = 'Rodriquez' OR first_name = 'Adam';

SELECT *
FROM customer
WHERE first_name = 'Ann' OR first_name = 'Anne'OR first_name = 'Annie';

SELECT *
FROM customer
WHERE first_name LIKE 'Ann%';

SELECT *
FROM customer
WHERE first_name LIKE 'A%' AND (LENGTH(first_name)>=3 AND LENGTH(first_name)<=5);

SELECT *
FROM customer
WHERE first_name LIKE 'Bra%' AND last_name != 'Motley';

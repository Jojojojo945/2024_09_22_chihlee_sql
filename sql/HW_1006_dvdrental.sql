DROP TABLE IF EXISTS customer;

CREATE TABLE IF NOT EXISTS customer(
	customer_id int,
	store_id int,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	email VARCHAR(100),
	address_id int,
	activebool VARCHAR(10),
	create_date date,
	last_update timestamp,
	active boolean
	);

SELECT *
FROM customer;

SELECT first_name /*選first_name只會出現first_name這欄*/
FROM customer
WHERE first_name = "Jamie"; /*是單引號不是雙引號*/

/*first_name為Jamie*/
SELECT *
FROM customer
WHERE first_name = 'Jamie';

/*first_name是Jamie,同時last_name是Rice*/
SELECT *
FROM customer
WHERE first_name = 'Jamie' AND last_name = 'Rice';

/*last_name是Rodriquez 或者 first_name是Adam*/
SELECT *
FROM customer
WHERE last_name = 'Rodriquez' OR first_name = 'Adam';

/*取出first_name是Ann,Anne,Annie*/
SELECT *
FROM customer
WHERE first_name = 'Ann' OR first_name = 'Anne' OR first_name = 'Annie';

/*取出字串開頭是Ann的first_name*/
SELECT *
FROM customer
WHERE first_name LIKE 'Ann%';

/*取出first_name第1個字元是A,同時first_name的字元長度是3到5的資料*/
SELECT *
FROM customer
WHERE first_name LIKE 'A%' AND (LENGTH(first_name)>=3 AND LENGTH(first_name)<=5);

SELECT *
FROM customer
WHERE first_name LIKE 'A%' AND LENGTH(first_name) BETWEEN 3 AND 5;

/*取出first_name,前3字為Bra,但last_name不是Motley*/
SELECT *
FROM customer
WHERE first_name LIKE 'Bra%' AND last_name != 'Motley';

SELECT *
FROM customer
WHERE first_name LIKE 'Bra%' AND last_name <> 'Motley';

SELECT *
FROM customer
WHERE first_name LIKE 'Bra%' AND last_name NOT LIKE 'Motley';
USE VOLK_MyBase;

SELECT * FROM orders;

SELECT region, city
FROM addresses
WHERE region = 'Minsk';

SELECT COUNT(*) AS 'Amount of rows' FROM customers;

SELECT DISTINCT TOP (1) * FROM orders;
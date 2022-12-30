USE VOLK_MyBase;

SELECT *
FROM orders
WHERE order_date LIKE '2022%';

SELECT *
FROM orders
WHERE order_date BETWEEN '2019/1/1' AND '2022/1/1';

SELECT *
FROM orders
WHERE amount IN (2, 10);
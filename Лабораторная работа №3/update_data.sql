USE VOLK_MyBase;

SELECT * FROM orders;

UPDATE orders SET amount = amount + 1 WHERE amount = 1;

SELECT * FROM orders;
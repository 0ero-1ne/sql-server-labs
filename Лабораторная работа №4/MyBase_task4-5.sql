use VOLK_MyBase;

select
	details.title as Деталь,
	customers.phone as Телефон,
	details.price as [Цена за деталь],
	CASE
		when (orders.amount = 2) then 'Два'
		when (orders.amount = 10) then 'Десять'
		when (orders.amount = 1) then 'Один'
	END Количество
FROM details
INNER JOIN orders ON orders.detail_id = details.detail_id
INNER JOIN customers ON orders.customer_id = customers.customer_id;

select
	details.title as Деталь,
	customers.phone as Телефон,
	details.price as [Цена за деталь],
	CASE
		when (orders.amount = 2) then 'Два'
		when (orders.amount = 10) then 'Десять'
		when (orders.amount = 1) then 'Один'
	END Количество
FROM details
INNER JOIN orders ON orders.detail_id = details.detail_id
INNER JOIN customers ON orders.customer_id = customers.customer_id
ORDER BY
(
	CASE
		WHEN (orders.amount = 1) THEN 1
		WHEN (orders.amount = 2) THEN 2
		WHEN (orders.amount = 10) THEN 3
	END
);
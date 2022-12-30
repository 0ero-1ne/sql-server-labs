use VOLK_MyBase;

select
	details.title as ������,
	customers.phone as �������,
	details.price as [���� �� ������],
	CASE
		when (orders.amount = 2) then '���'
		when (orders.amount = 10) then '������'
		when (orders.amount = 1) then '����'
	END ����������
FROM details
INNER JOIN orders ON orders.detail_id = details.detail_id
INNER JOIN customers ON orders.customer_id = customers.customer_id;

select
	details.title as ������,
	customers.phone as �������,
	details.price as [���� �� ������],
	CASE
		when (orders.amount = 2) then '���'
		when (orders.amount = 10) then '������'
		when (orders.amount = 1) then '����'
	END ����������
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
use UNIVER;

set transaction isolation level repeatable read;
begin tran;
	select * from GOODS where Name = 'Блокнот';
commit tran;

waitfor delay '00:00:05';
select '---------------';

set transaction isolation level repeatable read;
begin tran;
	select count(*) from GOODS where Name = 'Синяя шариковая ручка';
	select 'updated ORDERS' 'Result: ', GOOD, Qty from ORDERS where Qty = 5;
commit tran;

waitfor delay '00:00:05';
select '---------------';

set transaction isolation level repeatable read;
begin tran;
	select case
		when Name = 'Блокнот' then 'insert GOODS'
		else ' '
		end 'Result: ', Name from GOODS;
commit tran;
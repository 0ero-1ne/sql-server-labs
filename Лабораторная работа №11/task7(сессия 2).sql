use UNIVER;

set transaction isolation level serializable;
begin tran;
	select * from GOODS where Name = '�������';
commit tran;

waitfor delay '00:00:05';
select '---------------';

set transaction isolation level serializable;
begin tran;
	select count(*) from GOODS where Name = '����� ��������� �����';
	select 'updated ORDERS' 'Result: ', Good, Qty from ORDERS where Qty = 5;
commit tran;

waitfor delay '00:00:05';
select '---------------';

set transaction isolation level serializable;
begin tran;
	select case
		when Name = '�������' then 'insert GOODS'
		else ' '
		end 'Result: ', Name from GOODS;
commit tran;
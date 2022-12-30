use UNIVER;

set transaction isolation level read uncommitted;
begin tran;
	select * from GOODS where Name = '�������';
commit tran;

waitfor delay '00:00:05';

set transaction isolation level read uncommitted;
begin tran;
	select count(*) from GOODS where Name = '����� ��������� �����';
	select 'updated ORDERS' 'Result: ', Qty from ORDERS where Good = '����� ��������� �����';
commit tran;

waitfor delay '00:00:05';

set transaction isolation level read uncommitted;
begin tran;
	select case
		when Name = '�������' then 'insert GOODS'
		else ' '
		end 'Result: ', Name from GOODS;
commit tran;
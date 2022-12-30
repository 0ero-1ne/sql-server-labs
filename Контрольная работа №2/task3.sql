-- Вариант 3

use EXAMBD;
go

create procedure GETORDERSBYQTY @N int as
begin try
	select * from ORDERS where ORDERS.QTY > @N;
	return 1;
end try
begin catch
	print 'Error code: ' + cast(error_number() as varchar(6));
	print 'Error message: ' + error_message();
	print 'Error level: ' + cast(error_severity() as varchar(6));
	print 'Error state: ' + cast(error_state() as varchar(8));
	print 'Error line: ' + cast(error_line() as varchar(8));
	if error_procedure() is not null
		print 'Procedure name: ' + error_procedure();
	return -1;
end catch;
go

declare @rc int;
exec @rc = GETORDERSBYQTY @N = 9;
print 'Procedure code: ' + cast(@rc as varchar(3));
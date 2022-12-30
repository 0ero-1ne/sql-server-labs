-- вариант 3

use EXAMBD;
go

create procedure INSERT_GOOD @mfr_id char(3), @pr_id char(5), @desc varchar(20), @pr money, @qty int
as
begin try
	insert into PRODUCTS(MFR_ID, PRODUCT_ID, DESCRIPTION, PRICE, QTY_ON_HAND) values(@mfr_id, @pr_id, @desc, @pr, @qty);
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

declare @res int;
exec @res = INSERT_GOOD @mfr_id = 'ACI', @pr_id = 'GHGHG', @desc = 'Size X phone', @pr = 55.00, @qty = 153;
print 'Результат процедуры: ' + cast(@res as varchar(3));
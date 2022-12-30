use EXAMBD;
go

IF EXISTS ( SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[ADDOFFICE]') and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
    DROP PROCEDURE [dbo].[ADDOFFICE]
go

create procedure ADDOFFICE @office int, @city varchar(15), @region varchar(10), @mgr int, @target decimal(9, 2), @sales decimal(9, 2)
as
declare @rc int = 1;
begin try
	insert into OFFICES(OFFICE, CITY, REGION, MGR, TARGET, SALES) values (@office, @city, @region, @mgr, @target, @sales);
	return @rc;
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
exec @rc = ADDOFFICE @office = 14, @city = 'Chicago', @region = Western, @mgr = 108, @target = 450000.00, @sales = 344687.98;
print 'Procedure code: ' + cast(@rc as varchar(3));
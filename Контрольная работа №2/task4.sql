-- Вариант 3

use EXAMBD;
go

create function COUNTWORKERS (@name varchar(15)) returns int
as
begin
	declare @managerId int = ( select SALESREPS.EMPL_NUM from SALESREPS where SALESREPS.NAME like @name );
	declare @rc int = ( select count(*) from SALESREPS where SALESREPS.MANAGER = @managerId );
	return @rc;
end;
go

select dbo.COUNTWORKERS('Larry Fitch');
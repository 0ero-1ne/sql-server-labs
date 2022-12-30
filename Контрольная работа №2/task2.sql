-- Вариант 3

use EXAMBD;
go

create function COUNTORDERS (@company varchar(20)) returns int
as
begin
	declare @rc int = (select count(*) from ORDERS
						join CUSTOMERS
						on ORDERS.CUST = CUSTOMERS.CUST_NUM
						where CUSTOMERS.COMPANY like @company + '%');
	
	return @rc;
end;
go

select CUSTOMERS.COMPANY, dbo.COUNTORDERS(CUSTOMERS.COMPANY) from CUSTOMERS;
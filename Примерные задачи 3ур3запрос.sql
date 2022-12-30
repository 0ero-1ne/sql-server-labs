use EXAMBD;
go

create trigger UPDATE_MANAGER on SALESREPS after update
as
	declare @worker int, @manager int;
	set @manager = (select MANAGER from inserted);
	set @worker = (select MANAGER from SALESREPS where EMPL_NUM = @manager);

	if (@worker > 0) 
		update SALESREPS set MANAGER = 106 where EMPL_NUM = @manager;
return;
go

update SALESREPS set MANAGER = 103 where EMPL_NUM = 104;
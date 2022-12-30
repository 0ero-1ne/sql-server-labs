use UNIVER;
go

if exists (select 1 from sys.triggers where name = 'DDL_UNIVR')
	drop trigger DDL_UNIVER;
go

create trigger DDL_UNIVER on database for DDL_DATABASE_LEVEL_EVENTS
as
declare @t varchar(50) =  EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)');
declare @t1 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(50)');
declare @t2 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(50)');
if @t1 = 'FACULTY'
begin
	print 'Event type: ' + @t;
	print 'Event object: '+ @t1;
	print 'Object type: ' + @t2;
	raiserror( N'You do not have a permission to change or delete table FACULTY!', 16, 1);  
	rollback;
end;
go

alter table FACULTY add FACULTY_YEAR date;
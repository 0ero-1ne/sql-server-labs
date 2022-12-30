use UNIVER;
go

if exists (select 1 from sys.triggers where name = 'TR_INSTOF_FACULTY')
	drop trigger TR_INSTOF_FACULTY;
go

create trigger TR_INSTOF_FACULTY on FACULTY instead of delete
as
	raiserror(N'You can not delete data from FACULTY table!!!', 10, 1);
return;
go

delete from FACULTY where FACULTY.FACULTY = 'хр';
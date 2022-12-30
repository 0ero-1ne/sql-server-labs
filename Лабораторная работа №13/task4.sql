use UNIVER;
go

if object_id (N'FFACPUL', N'IF') IS NOT NULL
    drop function FFACPUL;
go

create function FCTEACHER(@p varchar(20)) returns int
as
begin
	declare @rc int = (select count(*) from TEACHER where TEACHER.PULPIT = isnull(@p, TEACHER.PULPIT));
	return @rc;
end;
go

select PULPIT.PULPIT [Pulpit], dbo.FCTEACHER(PULPIT.PULPIT) [Teachers count] from PULPIT;
select dbo.FCTEACHER(NULL) [Amount of teachers];
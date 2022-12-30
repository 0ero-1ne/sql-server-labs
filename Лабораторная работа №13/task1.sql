-- Вариант 3

use UNIVER;
go

if object_id (N'COUNT_STUDENTS', N'IF') IS NOT NULL
    drop function COUNT_STUDENTS;
go

create function COUNT_STUDENTS (@f varchar(20)) returns int
as
begin
	declare @rc int = 0;
	set @rc = (select count(STUDENT.IDSTUDENT) from STUDENT 
											   join GROUPS
											   on STUDENT.IDGROUP = GROUPS.IDGROUP
											   join FACULTY
											   on FACULTY.FACULTY = GROUPS.FACULTY
											   where FACULTY.FACULTY = @f);
	return @rc;
end;
go

declare @f int = dbo.COUNT_STUDENTS('ИТ');
print 'Количество студентов: ' + cast(@f as varchar(3));
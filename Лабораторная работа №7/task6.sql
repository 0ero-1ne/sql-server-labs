use UNIVER;
go

alter view PulpitsAmountView with schemabinding
as
select FACULTY.FACULTY_NAME [Faculty],
       count(PULPIT.PULPIT) [Pulpits amount]
from dbo.FACULTY
join dbo.PULPIT
on PULPIT.FACULTY = FACULTY.FACULTY
group by FACULTY.FACULTY_NAME;
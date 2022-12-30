use UNIVER;
go

if OBJECT_ID('PulpitsAmountView', 'V') IS NOT NULL
	drop view PulpitsAmountView;
go

create view PulpitsAmountView as
select FACULTY.FACULTY_NAME [Faculty], count(PULPIT.PULPIT) [Pulpits amount]
from FACULTY
join PULPIT
on PULPIT.FACULTY = FACULTY.FACULTY
group by FACULTY.FACULTY_NAME;
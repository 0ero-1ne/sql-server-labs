use UNIVER;
go

create view DisciplinesView as
select top(300) SUBJECT,
	   SUBJECT_NAME,
	   PULPIT
from SUBJECT
order by SUBJECT_NAME;
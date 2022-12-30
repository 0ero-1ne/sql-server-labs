use UNIVER;
go

if OBJECT_ID('TeacherView', 'V') IS NOT NULL
	drop view TeacherView;
go

create view TeacherView as
select TEACHER.TEACHER [Teacher code],
	   TEACHER.TEACHER_NAME [Teacher name],
	   TEACHER.GENDER [Gender],
	   TEACHER.PULPIT [Pulpit] 
from TEACHER;
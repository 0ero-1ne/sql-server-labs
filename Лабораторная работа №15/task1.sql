use UNIVER;
go

select rtrim(TEACHER.TEACHER) [TEACHER], TEACHER.TEACHER_NAME, TEACHER.GENDER
from TEACHER
where TEACHER.PULPIT = '����'
for xml path, root('TEACHERS');
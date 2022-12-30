use UNIVER;

select FACULTY.FACULTY,
	   case
		   when PROGRESS.NOTE between 4 and 5 then 'Сдал'
		   when PROGRESS.NOTE between 6 and 7 then 'Неплохо'
		   when PROGRESS.NOTE between 8 and 9 then 'Супер'
		   when PROGRESS.NOTE = 10 then 'Отлично'
	   end [Mark], count(*) [Amount]
from FACULTY
join GROUPS
on FACULTY.FACULTY = GROUPS.FACULTY
join STUDENT
on STUDENT.IDGROUP = GROUPS.IDGROUP
join PROGRESS
on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
where FACULTY.FACULTY = 'ИТ'
group by FACULTY.FACULTY,
		 case
		   when PROGRESS.NOTE between 4 and 5 then 'Сдал'
		   when PROGRESS.NOTE between 6 and 7 then 'Неплохо'
		   when PROGRESS.NOTE between 8 and 9 then 'Супер'
		   when PROGRESS.NOTE = 10 then 'Отлично'
end;
use UNIVER;
declare @students int = (select count(*) from STUDENT);

if @students > 100
	print 'Униыер получит новые компьютеры. УРА!!!';
else
	print 'Универ не получи новые компьютеры! Вы недостаточно большой универ!!!';
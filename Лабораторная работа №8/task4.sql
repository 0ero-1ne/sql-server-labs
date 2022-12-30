use UNIVER;

select STUDENT.NAME,
	   datediff(YEAR, STUDENT.BDAY, cast(getdate() as date)) - 1 [Age]
from STUDENT
where STUDENT.BDAY like '%-12-%';

select distinct DATENAME(WEEKDAY, PROGRESS.PDATE) [Exam day]
from PROGRESS
where PROGRESS.SUBJECT like 'СУБД';

declare @t int = 11,
		@x int = 10,
		@z float;

declare @FIO varchar(50) = 'Воликов Дмитрий Анатольевич';
declare	@newFIO varchar(50) = substring(@FIO, 1, charindex(' ', @FIO)) +
							  upper(substring(@FIO, charindex(' ', @FIO) + 1, 1)) + '. ' +
							  upper(substring(@FIO, charindex(' ', @FIO, charindex(' ', @FIO) + 1) + 1, 1)) + '.';

if @t > @x
	set @z = power(sin(@t), 2);
else if @t < @x
	set @z = 4 * (@t + @x);
else
	set @z = 1 - power(exp(1), @x - 2);

print 'z = ' + cast(@z as varchar(10));
print 'newFIO = ' + @newFIO;

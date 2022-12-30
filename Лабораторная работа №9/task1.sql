use UNIVER;
go

exec SP_HELPINDEX 'AUDITORIUM';
exec SP_HELPINDEX 'AUDITORIUM_TYPE';
exec SP_HELPINDEX 'FACULTY';
exec SP_HELPINDEX 'GROUPS';
exec SP_HELPINDEX 'PROFESSION';
exec SP_HELPINDEX 'PROGRESS';
exec SP_HELPINDEX 'PULPIT';
exec SP_HELPINDEX 'STUDENT';
exec SP_HELPINDEX 'SUBJECT';
exec SP_HELPINDEX 'TEACHER';

use tempdb;
go

checkpoint;  --фиксация БД
DBCC DROPCLEANBUFFERS;  --очистить буферный кэш

create table #TASK1
(
	TIND int,  
    TFIELD varchar(100)
);

set nocount on;

declare @i int = 0;

while @i < 1000
begin
	insert #TASK1 values(floor(20000 * RAND()), replicate('row', 10));
	if (@i % 100 = 0) print @i;
	set @i = @i + 1;
end;

select * from #TASK1 where TIND between 1500 and 2500 order by TIND;

checkpoint;  --фиксация БД
DBCC DROPCLEANBUFFERS;  --очистить буферный кэш

CREATE clustered index #TASK1_CL on #TASK1(TIND asc);

select * from #TASK1 where TIND between 1500 and 2500;

drop index #TASK1_CL on #TASK1;
drop table #TASK1;
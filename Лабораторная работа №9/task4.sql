use UNIVER;

create table #TASK4
(
	t_ind int identity(1, 1),
	t_num int,
	t_field varchar(20)
);

set nocount on;

declare @i int = 0;

while @i < 10000
begin
	insert #TASK4 values(floor(30000 * RAND()), 'Row ' + cast(@i as varchar));
	set @i = @i + 1;
end;

checkpoint;  --фиксация БД
DBCC DROPCLEANBUFFERS;  --очистить буферный кэш

SET STATISTICS TIME ON;
set statistics io on;
print 'First';
select t_num from #TASK4 where t_num >= 4500 and t_num <= 9000;
set statistics io off;
SET STATISTICS TIME OFF;

CREATE index #TASK4_NONCLUF on #TASK4(t_num) where (t_num >= 4500 and t_num <= 9000);

checkpoint;  --фиксация БД
DBCC DROPCLEANBUFFERS;  --очистить буферный кэш

SET STATISTICS TIME ON;
set statistics io on;
print 'Second';
select t_num from #TASK4 where t_num > 4500 and t_num < 9000;
set statistics io on;
SET STATISTICS TIME OFF;

drop index #TASK4.#TASK4_NONCLUF;
drop table #TASK4;
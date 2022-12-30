use UNIVER;

create table #TASK3
(
	t_ind int identity(1, 1),
	t_num int,
	t_field varchar(20)
);

set nocount on;

declare @i int = 0;

while @i < 10000
begin
	insert #TASK3 values(floor(30000 * RAND()), 'Row ' + cast(@i as varchar));
	set @i = @i + 1;
end;

checkpoint;  --фиксация БД
DBCC DROPCLEANBUFFERS;  --очистить буферный кэш

SET STATISTICS TIME ON
set statistics io on;
print 'First';
select t_ind from #TASK3 where t_num < 4500;
set statistics io off;
SET STATISTICS TIME OFF

CREATE index #TASK3_NONCLUP on #TASK3(t_num) INCLUDE (t_ind)

checkpoint;  --фиксация БД
DBCC DROPCLEANBUFFERS;  --очистить буферный кэш

SET STATISTICS TIME ON;
set statistics io on;
print 'Second';
select t_ind from #TASK3 where t_num < 4500;
set statistics io off;
SET STATISTICS TIME OFF;

drop index #TASK3.#TASK3_NONCLUP;
drop table #TASK3;
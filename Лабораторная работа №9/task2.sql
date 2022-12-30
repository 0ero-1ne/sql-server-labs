use UNIVER;

checkpoint;  --фиксация БД
DBCC DROPCLEANBUFFERS;  --очистить буферный кэш

create table #TASK2
(
	t_ind int identity(1, 1),
	t_num int,
	t_field varchar(20)
);

set nocount on;

declare @i int = 0;

while @i < 10000
begin
	insert #TASK2 values(floor(30000 * RAND()), 'Row ' + cast(@i as varchar));
	set @i = @i + 1;
end;

select * from #TASK2;
select * from #TASK2 where t_ind > 1000 and t_num < 4500;

checkpoint;  --фиксация БД
DBCC DROPCLEANBUFFERS;  --очистить буферный кэш

CREATE index #TASK2_NONCL on #TASK2(t_ind, t_num);

select * from #TASK2 where t_ind > 1000 and t_num < 4500;
select * from #TASK2 where t_ind = 1500;

drop index #TASK2.#TASK2_NONCL;
drop table #TASK2;
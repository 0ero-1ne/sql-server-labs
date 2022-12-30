use tempdb;

create table #TASK6
(
	t_ind int identity(1, 1),
	t_num int,
	t_field varchar(20)
);

declare @i int = 0;

set nocount on;
while @i < 10000
begin
	insert into #TASK6(t_num, t_field) values (RAND()*20000, 'Row ' + cast((@i + 1) as varchar(10)));
	set @i = @i + 1;
end;

create index #TASK6_TNUM ON #TASK6(t_num);

INSERT top(10000) #TASK6(t_num, t_field) select t_num, t_field from #TASK6;

select name [Индекс], 
	   avg_fragmentation_in_percent [Фрагментация (%)]
from sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'),
     OBJECT_ID(N'#TASK5'), NULL, NULL, NULL) ss
join sys.indexes ii
on ss.object_id = ii.object_id and ss.index_id = ii.index_id  
where name is not null;

drop index #TASK6_TNUM on #TASK6;
create index #TASK6_TNUM on #TASK6(t_num) with (fillfactor = 65);

INSERT top(50)percent INTO #TASK6(t_num, t_field) SELECT t_num, t_field  FROM #TASK6;

select name [Индекс], 
	   avg_fragmentation_in_percent [Фрагментация (%)]
from sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'),
     OBJECT_ID(N'#TASK5'), NULL, NULL, NULL) ss
join sys.indexes ii
on ss.object_id = ii.object_id and ss.index_id = ii.index_id  
where name is not null;

drop index #TASK6_TNUM on #TASK6;
drop table #TASK6;
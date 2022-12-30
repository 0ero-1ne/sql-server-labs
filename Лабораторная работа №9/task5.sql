use tempdb;

create table #TASK5
(
	t_ind int identity(1, 1),
	t_num int,
	t_field varchar(20)
);

declare @i int = 0;

set nocount on;
while @i < 10000
begin
	insert into #TASK5(t_num, t_field) values (RAND()*20000, 'Row ' + cast((@i + 1) as varchar(10)));
	set @i = @i + 1;
end;

create index #TASK5_TNUM ON #TASK5(t_num);

INSERT top(10000) #TASK5(t_num, t_field) select t_num, t_field from #TASK5;

select name [Индекс], 
	   avg_fragmentation_in_percent [Фрагментация (%)]
from sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'),
     OBJECT_ID(N'#TASK5'), NULL, NULL, NULL) ss
join sys.indexes ii
on ss.object_id = ii.object_id and ss.index_id = ii.index_id  
where name is not null;

alter index #TASK5_TNUM on #TASK5 reorganize;

select name [Индекс], 
	   avg_fragmentation_in_percent [Фрагментация (%)]
from sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'),
     OBJECT_ID(N'#TASK5'), NULL, NULL, NULL) ss
join sys.indexes ii
on ss.object_id = ii.object_id and ss.index_id = ii.index_id  
where name is not null;

alter index #TASK5_TNUM on #TASK5 rebuild with(online = off);

select name [Индекс], 
	   avg_fragmentation_in_percent [Фрагментация (%)]
from sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'),
     OBJECT_ID(N'#TASK5'), NULL, NULL, NULL) ss
join sys.indexes ii
on ss.object_id = ii.object_id and ss.index_id = ii.index_id  
where name is not null;

drop index #TASK5_TNUM on #TASK5;
drop table #TASK5;
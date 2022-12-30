create table #RANDOMSUM
(
	RANDOM_X int,
	RANDOM_Y int,
	SUM_X_Y varchar(200)
);

set nocount on;

declare @i int = 1;

while @i <= 10
	begin
		declare @x int = floor(10000 * rand());
		declare @y int = floor(10000 * rand());
		insert #RANDOMSUM values(@x, @y, @x + @y);
	set @i += 1;
end;

select * from #RANDOMSUM;
declare @char char = 'D',
		@varchar varchar(4) = 'BSTU',
		@datetime datetime,
		@time time,
		@int int,
		@smallint smallint,
		@tinyint tinyint,
		@numeric numeric(12, 5);

set @datetime = (select CAST(GETDATE() as datetime));
set @time = '20:46:00';

select @smallint = 2, @tinyint = 5, @numeric = 123.45;

select @char, @varchar, @datetime, @time;
print 'smallint = ' + cast(@smallint as varchar(50));
print 'tinyint = ' + cast(@tinyint as varchar(50));
print 'numeric = ' + cast(@numeric as varchar(50));
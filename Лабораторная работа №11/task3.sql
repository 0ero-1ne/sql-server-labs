use UNIVER;

create table #TASK3
(
	Name varchar(50) primary key,
	Age int not null,
	Country varchar(50) not null
);

insert into #TASK3 values ('Dmitry', 18, 'Belarus'),
						  ('Ivan', 18, 'Belarus'),
						  ('Nikita', 19, 'Belarus'),
						  ('Vladislav', 19, 'Belarus');

declare @point varchar(100);
begin try
	begin tran
		delete #TASK3 where Name like 'Dmitry';
		set @point = 'p1';
		save tran @point;
		delete #Task3 where Name like 'Ivan';
		set @point = 'p2';
		save tran @point;
		insert into #TASK3 values ('Nikita', 19, 'Belarus');
	commit tran
end try
begin catch
	print 'Ошибка: ' + case
		when error_number() = 2627 and patindex('%PK__#TASK3%', error_message()) > 0
		then 'Дублирование имён'
		else 'Неизвестная ошибка: ' + cast(error_number() as varchar(5)) + error_message()
	end;
	if @@trancount > 0
	begin
		print 'Контрольная точка: ' + @point;
		rollback tran @point;
		commit tran;
	end
end catch;

select * from #TASK3;

drop table #TASK3;
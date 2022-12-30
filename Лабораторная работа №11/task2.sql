use UNIVER;

create table #TASK2
(
	Name varchar(50) primary key,
	Age int not null,
	Country varchar(50) not null
);

insert into #TASK2 values ('Dmitry', 18, 'Belarus'),
						  ('Ivan', 18, 'Belarus'),
						  ('Nikita', 19, 'Belarus'),
						  ('Vladislav', 19, 'Belarus');

begin try
	begin tran
		delete #TASK2 where Name like 'Dmitry';
		delete #Task2 where Name like 'Ivan';
		insert into #TASK2 values ('Andrey', 19, 'Belarus');
	commit tran
end try
begin catch
	print 'Ошибка: ' + case
		when error_number() = 2627 and patindex('%PK__#TASK2%', error_message()) > 0
		then 'Дублирование имён'
		else 'Неизвестная ошибка: ' + cast(error_number() as varchar(5)) + error_message()
	end;
	if @@trancount > 0 rollback tran;
end catch;

select * from #TASK2;

drop table #TASK2;
use UNIVER;

select *
from
(
	select case
		when PROGRESS.NOTE = 10 then '10'
		when PROGRESS.NOTE between 8 and 9 then '8-9'
		when PROGRESS.NOTE between 6 and 7 then '6-7'
		when PROGRESS.NOTE between 4 and 5 then '4-5'
	end [Notes], COUNT(*) [Amount]
	from PROGRESS
	group by case
		when PROGRESS.NOTE = 10 then '10'
		when PROGRESS.NOTE between 8 and 9 then '8-9'
		when PROGRESS.NOTE between 6 and 7 then '6-7'
		when PROGRESS.NOTE between 4 and 5 then '4-5'
	end
) as T
order by case [Notes]
	when '10' then 1
	when '8-9' then 2
	when '6-7' then 3
	when '4-5' then 4
end;
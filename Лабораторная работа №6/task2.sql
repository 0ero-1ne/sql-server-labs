use UNIVER;

select AUDITORIUM_TYPE.AUDITORIUM_TYPE,
       max(AUDITORIUM.AUDITORIUM_CAPACITY) as [Maximum capacity],
	   min(AUDITORIUM.AUDITORIUM_CAPACITY) as [Minimum capacity],
	   avg(AUDITORIUM.AUDITORIUM_CAPACITY) as [Average capacity],
	   sum(AUDITORIUM.AUDITORIUM_CAPACITY) as [Summary capacity],
	   count(*) as [Auditorium amount]
from AUDITORIUM_TYPE
join AUDITORIUM
on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
group by AUDITORIUM_TYPE.AUDITORIUM_TYPE;
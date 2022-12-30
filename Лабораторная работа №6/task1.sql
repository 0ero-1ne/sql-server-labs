use UNIVER;

select max(AUDITORIUM.AUDITORIUM_CAPACITY) as [Maximum capacity],
	   min(AUDITORIUM.AUDITORIUM_CAPACITY) as [Minimum capacity],
	   avg(AUDITORIUM.AUDITORIUM_CAPACITY) as [Average capacity],
	   count(*) as [Auditorium amount]
from AUDITORIUM;
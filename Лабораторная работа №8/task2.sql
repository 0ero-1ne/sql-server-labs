use UNIVER;

declare @capacity int = (select sum(AUDITORIUM.AUDITORIUM_CAPACITY) from AUDITORIUM);

if @capacity >= 200
	begin
		select count(AUDITORIUM.AUDITORIUM) [All auditoriums],
			   avg(AUDITORIUM.AUDITORIUM_CAPACITY) [Average capacity],
			   (
			       select count(AUDITORIUM.AUDITORIUM)
				   from AUDITORIUM
				   where AUDITORIUM.AUDITORIUM_CAPACITY < (select avg(AUDITORIUM.AUDITORIUM_CAPACITY) from AUDITORIUM)
			   ) [Number of auditoriums with capacity < average capacity],
			   (
			       select cast(count(AUDITORIUM.AUDITORIUM) as float) / ( select cast(count(AUDITORIUM.AUDITORIUM) as float) from AUDITORIUM) * 100
				   from AUDITORIUM
				   where AUDITORIUM.AUDITORIUM_CAPACITY < (select avg(AUDITORIUM.AUDITORIUM_CAPACITY) from AUDITORIUM)
			   ) [Percent of auditoriums]
		from AUDITORIUM
	end
else
	print '<200';
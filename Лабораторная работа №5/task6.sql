use UNIVER;

select top(1)
	(
		select avg(PROGRESS.NOTE)
		from PROGRESS
		where PROGRESS.SUBJECT like 'ад'
	) [ад],
	(
		select avg(PROGRESS.NOTE)
		from PROGRESS
		where PROGRESS.SUBJECT like 'нюХо'
	) [нюХо],
	(
		select avg(PROGRESS.NOTE)
		from PROGRESS
		where PROGRESS.SUBJECT like 'ясад'
	) [ясад]
from PROGRESS;
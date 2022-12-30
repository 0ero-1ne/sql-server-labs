use UNIVER;

declare @subject varchar(10),
		@idStudent int,
		@pdate date,
		@note int,
		@luckyStudent int = 1019;

declare ProgressUpdate cursor local dynamic
for
select PROGRESS.IDSTUDENT,
	   PROGRESS.NOTE,
	   PROGRESS.IDSTUDENT,
	   PROGRESS.SUBJECT
from PROGRESS for update;

open ProgressUpdate;
fetch ProgressUpdate into @idStudent, @note, @idStudent, @subject;
while @@fetch_status = 0
begin
	if (@note < 4)
	begin
		if (@idStudent <> @luckyStudent)
			delete PROGRESS where current of ProgressUpdate;
		else
			update PROGRESS set PROGRESS.NOTE = PROGRESS.NOTE + 1 where current of ProgressUpdate;
	end;
	fetch ProgressUpdate into @idStudent, @note, @idStudent, @subject;
end;
close ProgressUpdate;
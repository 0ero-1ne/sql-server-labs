use UNIVER;

begin try
	update FACULTY set FACULTY.FACULTY = 10
					where FACULTY.FACULTY like 'хр';
end try
begin catch
	print ERROR_NUMBER();
	print ERROR_MESSAGE();
	print ERROR_LINE();
	print ERROR_PROCEDURE();
	print ERROR_SEVERITY();
	print ERROR_STATE();
end catch;
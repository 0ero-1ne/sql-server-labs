use UNIVER;
declare @students int = (select count(*) from STUDENT);

if @students > 100
	print '������ ������� ����� ����������. ���!!!';
else
	print '������ �� ������ ����� ����������! �� ������������ ������� ������!!!';
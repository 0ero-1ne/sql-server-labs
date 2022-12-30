declare @x int = 1, @y int = 29;
print 'Computing...';
print '29 - 1 = ' + cast((@y - @x) as varchar(100));
print 'Computed';
return;
print 'I am alone';
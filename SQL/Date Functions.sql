SELECT CURRENT_TIMESTAMP;


--Add one year to a date, then return the date
SELECT DATEADD(year, 1, '2017/08/25') AS DateAdd;


--Datediff
SELECT DATEDIFF(year, '2011/08/25','2017/08/25' ) AS DateDiff;
SELECT DATEDIFF(month, '2017/08/25', '2011/08/25') AS DateDiff;
SELECT DATEDIFF(hour, '2017/08/25 07:00', '2017/08/25 12:45') AS DateDiff;


SELECT DATEFROMPARTS(2018, 10, 31) AS DateFromParts;


--Returns Name Of Given Part For Example Month is 01 then it returns January
SELECT DATENAME(year, '2017/08/25') AS DatePartString;
SELECT DATENAME(MONTH, GETDATE()) AS MonthName;


--Returns Number Of Given Part For Example Month is 01 then it returns 1
SELECT DATEPART(year, '2017/08/25') AS DatePartInt;
SELECT DATEPART(MONTH, GETDATE()) AS MonthNumber;


--Return the day of the month for a date
SELECT DAY('2017/08/25') AS DayOfMonth;


--Return the month part of a date:
SELECT MONTH('2017/08/25') AS Month; 


--Return the year part of a date:
SELECT YEAR('2017/08/25') AS Year;


SELECT GETDATE();


SELECT GETUTCDATE();


--Check if the expression is a valid date:
SELECT ISDATE('2017-08-25');


--Return the date and time of the SQL Server:
SELECT SYSDATETIME() AS SysDateTime;
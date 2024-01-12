SELECT CAST('2017-08-25' AS datetime);

--Return the first non-null value in a list:
SELECT COALESCE(NULL, NULL, NULL, 'W3Schools.com', NULL, 'Example.com');


SELECT CONVERT(int, 25.65);


SELECT CURRENT_USER;

--IIF(condition, value_if_true, value_if_false)
SELECT IIF(500<1000, 'YES', 'NO');


SELECT ISNULL(NULL, 'W3Schools.com');

Select * From Employeenew
Select ISNULL(Gender,'Nothing') From Employeenew


SELECT ISNUMERIC(20*3);
Select ISNUMERIC(Id) From Employeenew

-- returns NULL if two expressions are equal, otherwise it returns the first expression
SELECT NULLIF(25, 25);


SELECT SESSION_USER;


SELECT SESSIONPROPERTY('ANSI_NULLS');
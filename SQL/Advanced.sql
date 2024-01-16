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


--Row Number
SELECT 
    ROW_NUMBER() OVER (ORDER BY Id) AS RowNumber,
    *
FROM Employeenew;


--RANK() and DENSE_RANK()
--So, in summary, RANK() might leave gaps between ranks for tied values, while DENSE_RANK() ensures continuous ranking without gaps for tied values. 
SELECT 
    RANK() OVER (ORDER BY Salary DESC) AS Rank,
    DENSE_RANK() OVER (ORDER BY Salary DESC) AS DenseRank,
    *
FROM Employeenew;


--LEAD() and LAG(): Retrieve the next and previous employee's age.
SELECT 
    FullName,
    Age,
    LEAD(Age) OVER (ORDER BY Age) AS NextAge,
    LAG(Age) OVER (ORDER BY Age) AS PreviousAge
FROM Employeenew;


CREATE FUNCTION dbo.GetSalaryDetails(@salary INT)
RETURNS TABLE
AS
RETURN
(
    SELECT
        @salary AS Salary,
        CASE
            WHEN @salary >= 60000 THEN 'High Salary'
            WHEN @salary >= 50000 THEN 'Medium Salary'
            ELSE 'Low Salary'
        END AS SalaryCategory
);

Select * from Employeenew

--Cross(not display null)
SELECT
    e.FullName,
    e.Salary,
    s.SalaryCategory
FROM Employeenew e
CROSS APPLY dbo.GetSalaryDetails(e.Salary) s;

--Outer(Will display null record)
SELECT
    e.FullName,
    e.Salary,
    s.SalaryCategory
FROM Employeenew e
OUTER APPLY dbo.GetSalaryDetails(e.Salary) s;



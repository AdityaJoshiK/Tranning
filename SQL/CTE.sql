-- Common Table Expression (CTE)
With New_CTE
as
(
	select * from Employeenew where Age>=25
)
select * from New_CTE

--Cursor is used to perform operation on retrived data, it store it for temporary




With New_CteWithParam(Id,FullName,Gender,Age)
as
(
	Select Id,FullName,Gender,Age from Employeenew--it should use all which are specifyed in parameter
)
select * from New_CteWithParam



--Insert with CTE
With New_CTE
as
(
	select * from Employeenew where Age>=25
)
--It insert data into original employeenew table
insert New_CTE VALUES (
    'John Doe',      -- Replace with the actual full name
    'M',             -- Replace with the actual gender (M or F)
    30,              -- Replace with the actual age
    '2024-01-22',    -- Replace with the actual hire date in the format 'YYYY-MM-DD'
    'john@example.com', -- Replace with the actual email address
    60000.00,        -- Replace with the actual salary
    'http://www.johndoe.com' -- Replace with the actual personal website
);
--same we can do all operations

--if we need to store cte data then we can use view
--Cursor is temp memory, manipulate one row at a time

--Implicit
--Default Cursors(Invoked automatically)

--Explicit
--Create By User

--Methods
-- Next,Prior(Previous record)
--First,Last
--Absolute n,Relative n

select * from Employeenew

--Without Cursor Variable

--Declare
declare myCursor cursor scroll for select * from Employeenew

--open
open myCursor

--fetch
fetch first from myCursor
fetch next from myCursor
fetch prior from myCursor
fetch last from myCursor
fetch absolute 4 from myCursor
fetch relative 4 from myCursor

--close
close myCursor

--deallocate
deallocate myCursor



--With Cursor Variables
--Declare
declare myCursor cursor scroll for select Id,FullName from Employeenew
declare @emp_id as int,@emp_name as varchar(50)

--open
open myCursor

--fetch
fetch first from myCursor into @emp_id,@emp_name
print 'Employee is: '  + cast(@emp_id as varchar(50))+ @emp_name

fetch next from myCursor into @emp_id,@emp_name
print 'Employee is: '  + cast(@emp_id as varchar(50))+ @emp_name

fetch prior from myCursor into @emp_id,@emp_name
print 'Employee is: '  + cast(@emp_id as varchar(50))+ @emp_name

fetch last from myCursor into @emp_id,@emp_name
print 'Employee is: '  + cast(@emp_id as varchar(50))+ @emp_name

fetch absolute 4 from myCursor into @emp_id,@emp_name
print 'Employee is: '  + cast(@emp_id as varchar(50))+ @emp_name

fetch relative 4 from myCursor into @emp_id,@emp_name
print 'Employee is: '  + cast(@emp_id as varchar(50))+ @emp_name


--close
close myCursor

--deallocate
deallocate myCursor


--Types of cursor
--Static Cursor -  read-only cursor, creates a temporary copy of the result set in a temporary table.
-- FAST_FORWARD - Default, creates a temporary copy of the result set. It is optimized for forward-only, read-only operations
--DYNAMIC - reflects changes made to the underlying data as the cursor is moved. It allows scrolling in both forward and backward directions, and updates made by the cursor are visible immediately.
--KEYSET - It allows for updates to the data and reflects changes made by other users. It does not necessarily reflect the current state of the data in the underlying table.


--Iterate all
-- Declare variables
DECLARE @Id INT,
        @FullName NVARCHAR(100),
        @Gender CHAR(1),
        @Age INT,
        @HireDate DATE,
        @EmailAddress NVARCHAR(100),
        @Salary DECIMAL(10,2),
        @PersonalWebSite NVARCHAR(100)

-- Declare and set up the cursor
DECLARE employeeCursor CURSOR FOR
SELECT [Id], [FullName], [Gender], [Age], [HireDate], [EmailAddress], [Salary], [PersonalWebSite]
FROM [AdityaPractice].[dbo].[Employeenew]

-- Open the cursor
OPEN employeeCursor

-- Fetch the first row into variables
FETCH NEXT FROM employeeCursor INTO @Id, @FullName, @Gender, @Age, @HireDate, @EmailAddress, @Salary, @PersonalWebSite

--Check the number of rows affected by the last FETCH
--SELECT @@CURSOR_ROWS AS 'RowsAffectedByLastFetch'


-- Loop through the result set
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Perform operations on the current row (replace this with your logic)
    PRINT 'Processing Employee Id: ' + CAST(@Id AS NVARCHAR(10)) +
          ', Name: ' + @FullName +
          ', Gender: ' + @Gender +
          ', Age: ' + CAST(@Age AS NVARCHAR(10)) +
          ', Hire Date: ' + CONVERT(NVARCHAR(10), @HireDate, 120) +
          ', Email: ' + @EmailAddress +
          ', Salary: ' + CAST(@Salary AS NVARCHAR(20)) +
          ', Website: ' + @PersonalWebSite
    -- You can perform other operations or computations here

    -- Fetch the next row
    FETCH NEXT FROM employeeCursor INTO @Id, @FullName, @Gender, @Age, @HireDate, @EmailAddress, @Salary, @PersonalWebSite
END

-- Close and deallocate the cursor
CLOSE employeeCursor
DEALLOCATE employeeCursor

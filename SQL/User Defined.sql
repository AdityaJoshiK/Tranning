--User Defined Datatype
Create Type PhoneNumber from Nvarchar(10)


--User Defined Table
-- Create a user-defined table type( create a custom data type that represents a structured set of data)
CREATE TYPE dbo.EmployeeTableType AS TABLE
(
    EmployeeID INT,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department NVARCHAR(50)
);

-- Create a stored procedure that accepts the user-defined table type as a parameter
CREATE PROCEDURE dbo.InsertEmployees
    @Employees dbo.EmployeeTableType READONLY
AS
BEGIN
    INSERT INTO EmployeeTable (EmployeeID, FirstName, LastName, Department)
    SELECT EmployeeID, FirstName, LastName, Department
    FROM @Employees;
END;

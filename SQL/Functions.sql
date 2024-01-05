
--Scalar Valued Function-Take one or more	parma and return single value
--Can't return text,ntext,image,cursor,timestamp
--if and while can be ue
create function Addition(@n1 as int,@n2 as int)
returns int
as
begin
	return (@n1+@n2)
end

Select dbo.Addition(2,5)



--inline table function
--returns table
create function GetEmployees()
returns table
as
return (select * from Employee)

create function GetEmployeesByID(@id int)
returns table
as
return (select * from Employee where EmployeeID=@id)

select * from dbo.GetEmployees()
select * from GetEmployeesById(2)



--Multi Statement Table Valued Function
create function GetEmployeesByGender(@gender varchar(20))
returns @myTable table (emp_id int, emp_name varchar(50),gender varchar(50))
as
begin
	insert into @myTable
	select EmployeeID,Name,Gender from Employee where Gender=@gender

	return
end

select * from dbo.GetEmployeesByGender('Female')
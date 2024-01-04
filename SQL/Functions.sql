
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

select * from GetEmployees()
select * from GetEmployeesById(2)
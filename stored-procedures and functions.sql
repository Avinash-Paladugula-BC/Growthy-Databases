use Growthy;
show tables;

-- Exercise 1

-- created a wrong procedure first dropped it and created the procedure with the same name
drop procedure if exists GetEmployeeDetails;

DELIMITER $$

create procedure GetEmployeeDetails(in emp_id int)
begin
    select EmployeeID, EmployeeName, DepartmentID
    from Employee
    where EmployeeID = emp_id;
end$$

DELIMITER ;

select * from Employee;

call GetEmployeeDetails(101);

-- Exercise 2
show tables;
create table Emp(
	empid int primary key,
    empname varchar(50) not null,
    monthly_salary int
);
insert into Emp(empid, empname, monthly_salary) values (1, "John", 1000), (2,"Saketh", 2000), (3,"Surya", 5000);

drop procedure if exists CalculateAnnualSalary;

DELIMITER $$
CREATE PROCEDURE CalculateAnnualSalary(IN emp_id INT)
BEGIN
    SELECT monthly_salary * 12 AS AnnualSalary
    FROM Emp
    WHERE empid = emp_id;
END$$
DELIMITER ;

call CalculateAnnualSalary(2);
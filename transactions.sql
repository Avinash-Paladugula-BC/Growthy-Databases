use Growthy;

-- Exercise 1
create table employees(
	eid int primary key auto_increment,
    ename varchar(50),
    salary decimal
);

insert into employees (ename, salary) values
('Alice', 60000),
('Bob', 55000),
('Charlie', 45000),
('David', 70000),
('Eva', 50000);


START TRANSACTION;
SELECT Salary FROM Employees WHERE EmployeeID = 1 FOR UPDATE;
UPDATE Employees SET Salary = Salary + 5000 WHERE EmployeeID = 1;
COMMIT;

START TRANSACTION;
SELECT Salary FROM Employees WHERE EmployeeID = 1 FOR UPDATE;
UPDATE Employees SET Salary = Salary + 3000 WHERE EmployeeID = 1;
COMMIT;
SELECT * FROM employees;

-- Exercise 2

DELIMITER $$

create function annual_salary(monthly_salary decimal)
	returns decimal
DETERMINISTIC
begin

	-- set annual_salary = monthly_salary * 12;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
		RETURN null;

	return monthly_salary * 12;
END$$
DELIMITER ;


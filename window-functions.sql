use Growthy;
show tables;
-- Exercise 1
create table Employeess (
   EmployeeID int,
   EmployeeName varchar(100),
   DepartmentID int,
   Salary decimal,
   SalaryMonth date
);

insert into Employeess (EmployeeID, EmployeeName, DepartmentID, Salary, SalaryMonth) VALUES
(101, 'Alice', 1, 4000.00, '2025-01-01'),
(102, 'Bob',   1, 4200.00, '2025-02-01'),
(103, 'Charlie',1, 4400.00, '2025-03-01'),
(104, 'David', 1, 4600.00, '2025-04-01'),
(105, 'Emma',  1, 4800.00, '2025-05-01'),

(201, 'Frank', 2, 5000.00, '2025-01-01'),
(202, 'Grace', 2, 5100.00, '2025-02-01'),
(203, 'Helen', 2, 5200.00, '2025-03-01'),
(204, 'Ian',   2, 5300.00, '2025-04-01'),
(205, 'Jack',  2, 5400.00, '2025-05-01');

select 
    DepartmentID,
    SalaryMonth,
    EmployeeID,
    Salary,
    avg(Salary) over(
        partition by DepartmentID
        order by SalaryMonth
        rows between 2 preceding and current ROW
    ) as Movin_Avg_Salary
from Employeess
order by DepartmentID, SalaryMonth;

select * from Employeess;



-- Exercise 2
create table Emps (
    EmployeeID int primary key,
    EmployeeName varchar(100),
    DepartmentID int,
    HireDate date
);

INSERT INTO Emps (EmployeeID, EmployeeName, DepartmentID, HireDate) VALUES
(101, 'Alice',   1, '2022-01-15'),
(102, 'Bob',     1, '2022-03-10'),
(103, 'Charlie', 1, '2022-03-10'),
(104, 'David',   1, '2022-06-20'),
(201, 'Emma',    2, '2021-02-05'),
(202, 'Frank',   2, '2021-05-18'),
(203, 'Grace',   2, '2021-05-18'),
(204, 'Helen',   2, '2021-09-30'),
(301, 'Ian',     3, '2023-01-01'),
(302, 'Jack',    3, '2023-04-25'),
(303, 'Kelly',   3, '2023-07-12');


select
    DepartmentID,
    EmployeeID,
    EmployeeName,
    HireDate,
    rank() over(partition by DepartmentID order by HireDate) as HireRank,
    row_number() over ( partition by DepartmentID order by HireDate) as HireRowNum
from Emps
order by DepartmentID, HireDate;

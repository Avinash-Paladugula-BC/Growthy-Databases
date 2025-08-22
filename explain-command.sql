use Growthy;

create table Dept (
    DepartmentID int primary key auto_increment,
    DepartmentName varchar(100) not null
);
insert into Dept (DepartmentName) values
('IT'),
('HR'),
('Finance'),
('Marketing'),
('Sales');

drop table Employees;
Drop table Dept;
show tables;
create table Employees (
    EmployeeID int primary key auto_increment,
    EmployeeName varchar(100) not null,
    DepartmentID int,
    HireDate date,
    Salary decimal,
    foreign key (DepartmentID) references Dept(DepartmentID)
);
insert into Employees (EmployeeName, DepartmentID, HireDate, Salary) values
('Alice', 1, '2020-01-15', 60000),
('Bob', 1, '2019-03-22', 55000),
('Charlie', 2, '2018-07-10', 45000),
('David', 3, '2021-09-05', 70000),
('Eva', 4, '2017-11-30', 50000),
('Frank', 5, '2022-05-12', 48000);

-- using the explain command
explain
select e.EmployeeID, e.EmployeeName, d.DepartmentName
from Employees e
join Departments d
    on e.DepartmentID = d.DepartmentID
where d.DepartmentName = 'IT';

create index dept_name_idx on Dept(DepartmentName);

create index emp_dept_idx on Employees(DepartmentID);

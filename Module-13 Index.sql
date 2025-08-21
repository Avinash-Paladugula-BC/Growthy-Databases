use Growthy;
show tables;

create table Employees(
	eID int primary key,
    FirstName varchar(50),
    LastName varchar(50),
    PhoneNumber varchar(10)
);
INSERT INTO Employees (eID, FirstName, LastName, PhoneNumber) VALUES
(1, 'Rahul', 'Sharma', '9876543210'),
(2, 'Priya', 'Mehta', '9123456780'),
(3, 'Amit', 'Kumar', '9988776655'),
(4, 'Sneha', 'Patel', '9812345678'),
(5, 'Arjun', 'Reddy', '9090909090'),
(6, 'Neha', 'Verma', '9765432109'),
(7, 'Ravi', 'Nair', '9321654789'),
(8, 'Kiran', 'Singh', '9456123789'),
(9, 'Anita', 'Joshi', '9532147896'),
(10, 'Vikram', 'Gupta', '9871234560');

-- Exercise 1
create index idx_employee_name on Employees (Lastname, FirstName);
show index from Employees;

-- Exercise 2
create index idx_ProductID on Products (ProductID);
show index from Products;

-- Exercise 3
drop index idx_employee_name on Employees;
show index from Employees;
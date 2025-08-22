use Growthy;

-- Exercise -1
Create table Departments(
	DepartmentID int primary key,
    DepartmentName varchar(100) not null
);

INSERT INTO Departments VALUES (1, 'HR'), (2, 'IT');



create table Employee(
	EmployeeID int primary key,
    EmployeeName VARCHAR(100) NOT NULL,
    DepartmentID INT,
	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) ON DELETE CASCADE
);
INSERT INTO Employee VALUES 
(101, 'Alice', 1),
(102, 'Bob', 1),
(103, 'Charlie', 2);

SELECT * FROM Employee;

DELETE FROM Departments WHERE DepartmentID = 1;

SELECT * FROM Employee;


-- Exercise 2
create table AuditLog (
	AuditID int auto_increment primary key,
    EmployeeID int not null,
    OldDepartmentID int,
    NewDepartmentID int,
    ChangeDate timestamp default current_timestamp
);

DELIMITER $$
create trigger trigger_audit_log
after update on Employee
for each row
begin
    if old.DepartmentID <> new.DepartmentID then
        insert into AuditLog (EmployeeID, OldDepartmentID, NewDepartmentID)
        values (old.EmployeeID, old.DepartmentID, new.DepartmentID);
    end if;
end$$
DELIMITER ;

truncate table Employee;
select * from Employee;
truncate table Departments;
select * from Departments;
delete from Departments where DepartmentID=2;

insert into Departments values (1, 'HR'), (2, 'IT'), (3, 'Finance');
insert into Employee values (101, 'Alice', 1), (102, 'Bob', 2);

update Employee
set DepartmentID = 3
where EmployeeID = 101;

select * from AuditLog;
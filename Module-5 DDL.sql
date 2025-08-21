show databases;

use Growthy;

-- ***********************DDL MODULE****************************

-- Exercise 1: create tables (HOA 1)
CREATE TABLE Employees (
	EmployeeID int PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    HireDate DATE,
    Department VARCHAR(50));
    
-- Exercise 2: Modifying tables (HOA 1)
ALTER table Employees
ADD column Salary Decimal;

describe Employees;

ALTER table Employees
MODIFY column Department VARCHAR(100);


-- Exercise 3: Deleting Tables:
DROP TABLE Employees;

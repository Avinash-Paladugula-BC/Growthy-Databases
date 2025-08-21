show databases;
use Growthy;
show tables;

-- Exercise 1 
create table Categories(
	CategoryID int primary key,
    CategoryName varchar(100)
);
describe Categories;
insert into Categories( CategoryID, CategoryName) values(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books'),
(4, 'Groceries');

create table Products(
	ProductID int primary key,
    ProductName varchar(100),
    CategoryID int,
    Price decimal,
    StockQuantity int,
    Foreign key(CategoryID) references Categories(CategoryID)
);
describe Products;
INSERT INTO Products (ProductID, ProductName, CategoryID, Price, StockQuantity) VALUES
(101, 'Smartphone', 1, 25000.00, 50),
(102, 'Laptop', 1, 55000.00, 30),
(103, 'T-Shirt', 2, 499.00, 200),
(104, 'Jeans', 2, 1299.00, 100),
(105, 'Novel - The Alchemist', 3, 299.00, 75),
(106, 'Rice 10kg', 4, 550.00, 40),
(107, 'Milk 1L', 4, 50.00, 150);

create view ProductDetails as
select ProductID, ProductName, CategoryName, Price
from Categories c
join Products p
on c.CategoryID=p.CategoryID;

select * from ProductDetails;


-- Exercise 2
alter view ProductDetails as
select ProductID, ProductName, CategoryName, Price, StockQuantity
from Categories c
join Products p
on c.CategoryID=p.CategoryID;
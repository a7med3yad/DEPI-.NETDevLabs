use Northwind

-- Inner Join : 
select * from Products
select * from Categories

select ProductName,CategoryName,UnitPrice from Products as p
inner join Categories as c
on c.CategoryID = p.CategoryID
order by ProductName desc;

select * from Suppliers

select productName,CategoryName,UnitPrice,CompanyName from Products as p
inner join Categories as c
on c.CategoryID = p.CategoryID
inner join Suppliers as s
on s.SupplierID = p.SupplierID
order by ProductName desc;

select ProductID,productname,CategoryName,UnitPrice from Products as p
left join Categories as c
on c.CategoryID = p.CategoryID
order by ProductID

select ProductID,productname,CategoryName,UnitPrice from Categories as c
left join Products as p
on c.CategoryID = p.CategoryID
order by ProductID


select productid,productname,categoryname,companyName from Products as p
left join Categories as c
on c.CategoryID = p.CategoryID
left join Suppliers as s
on p.SupplierID = s.SupplierID
order by CompanyName



select * from Orders
Select * from Products
select * from [Order Details]


SELECT p.ProductName, o.OrderID
FROM Orders AS o
RIGHT JOIN [Order Details] AS os ON os.OrderID = o.OrderID
RIGHT JOIN Products AS p ON os.ProductID = p.ProductID;

create schema pm;
go

CREATE TABLE pm.projects(
    id INT PRIMARY KEY IDENTITY,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE pm.members(
    id INT PRIMARY KEY IDENTITY,
    name VARCHAR(120) NOT NULL,
    project_id INT,
    FOREIGN KEY (project_id) 
        REFERENCES pm.projects(id)
);

INSERT INTO 
    pm.projects(title)
VALUES
    ('New CRM for Project Sales'),
    ('ERP Implementation'),
    ('Develop Mobile Sales Platform');


INSERT INTO
    pm.members(name, project_id)
VALUES
    ('John Doe', 1),
    ('Lily Bush', 1),
    ('Jane Doe', 2),
    ('Jack Daniel', null);

go

SELECT * FROM pm.projects;

SELECT * FROM pm.members;

select m.name member, p.title project from pm.members as m
full outer join 
pm.projects as p
on p.id = m.project_id


select m.name member, p.title project from pm.members as m
full outer join 
pm.projects as p
on p.id = m.project_id
where p.id is null or m.name is null;


/*
-- this code get 2 most expensive products in each category
SELECT 
    c.CategoryName,
    p.ProductName,
	UnitPrice
FROM 
    Categories c
CROSS APPLY (
    SELECT TOP 2 *
    FROM Products p
    WHERE p.CategoryID = c.CategoryID
    ORDER BY p.UnitPrice, p.ProductName
) p
ORDER BY 
    c.CategoryName DESC,p.UnitPrice;
go*/


--create function


CREATE FUNCTION GetTopProductsByCategory (@CategoryID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT TOP 2 *
    FROM Products p
    WHERE p.CategoryID = @CategoryID
    ORDER BY p.UnitPrice DESC, p.ProductName
);


select p.productname,c.CategoryName from Categories c 
cross apply GetTopProductsByCategory(c.CategoryID)p
order by CategoryName,p.UnitPrice DESC;

CREATE TABLE product_json(
    id INT IDENTITY PRIMARY KEY,
    info NVARCHAR(MAX)
);


INSERT INTO product_json(info)
VALUES 
    ('{"Name": "Laptop", "Price": 999, "Category": "Electronics"}'),
    ('{"Name": "Headphones", "Price": 99, "Category": "Electronics"}'),
    ('{"Name": "Book", "Price": 15, "Category": "Books"}');
go

select *from product_json

select p.id,j.* from product_json as p
cross apply openjson (p.info) with
(
Name Nvarchar(100),
Price Decimal(10,2),
Category Nvarchar(100)
) as j;

CREATE TABLE companies(
   id INT IDENTITY PRIMARY KEY,
   name VARCHAR(255) NOT NULL
);

INSERT INTO
  companies (name)
VALUES
  ('ABC Corporation'),
  ('XYZ Inc.'),
  ('JK Pte Ltd');

go


--?? ?? ???? ???? ?????? ???????? ?? corporation 
select trim(r3.name) companyname from companies as c
cross apply(select replace(c.name,'Corporation','')name)as r1
cross apply(select replace(r1.name,'Inc.','')name)as r2
cross apply(select replace(r2.name,'Pte Ltd','')name)as r3;

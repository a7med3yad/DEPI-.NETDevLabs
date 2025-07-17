--1;
SELECT LastName FROM Employees;
go
--2:
SELECT LastName FROM Employees;
go
--3:
SELECT * FROM Employees
WHERE LastName = 'Smith';
go
--4:
SELECT * FROM Employees
WHERE LastName IN ('Smith', 'Doe');
go
--5:
SELECT * FROM Employees
WHERE Department = 14;
go
--6:
SELECT * FROM Employees
WHERE Department IN (37, 77);
go

--7:
SELECT * FROM Employees
WHERE LastName LIKE 'S%';
go
--8:
SELECT SUM(Budget) AS TotalBudget
FROM Departments;
go
--9:
SELECT 
    e.Department, 
    d.Name, 
    COUNT(*) AS [Number of Employees]
FROM 
    Employees e
JOIN 
    Departments d ON e.Department = d.Code
GROUP BY 
    e.Department, d.Name;
go
--10:
SELECT * 
FROM Employees e
JOIN Departments d ON e.Department = d.Code;
go
--11:
SELECT 
    e.Name, 
    e.LastName, 
    d.Name AS DepartmentName, 
    d.Budget
FROM 
    Employees e
JOIN 
    Departments d ON e.Department = d.Code;
go
--12:
SELECT 
    e.Name, 
    e.LastName
FROM 
    Employees e
JOIN 
    Departments d ON e.Department = d.Code
WHERE 
    d.Budget > 60000;
go

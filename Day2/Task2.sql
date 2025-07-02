-- task 2:

-- create db
create database AhmedDB
go
use AhmedDB
go
-- create table
Create Table Employees(
empID int primary key identity,
empName varchar(50) not null,
phone varchar(11) not null,
email varchar(100) not null,
job varchar (100) not null,
department varchar(100) not null
)
go
-- insert 
insert into Employees
values ('Ahmed','01207549410','ahmed@gmail.com','Software Engineer','IT'),
('Mohamed','01204141558','Mohamed@gmail.com','Data Engineer','IT'),
('Youssef','0123654789','Youssef@gmail.com','Instructor','Teaching'),
('Gamal','0125364789','Gamal@gmail.com','Tester','IT'),
('Yassin','01254788999','Yassin@gmail.com','cloud Engineer','IT')
go
SET IDENTITY_INSERT Employees ON;
INSERT INTO Employees(empID, empName, Email, phone, Job,department)
VALUES (7, 'mahdy', 'mahdy@yahoo.com', '012354687', 'Developer', 'IT');
SET IDENTITY_INSERT Employees OFF;
go
-- reset Ientity Without Delete Data :
DBCC CHECKIDENT ('Employees', RESEED, 5)
go

insert into Employees
values ('Seif','01207549410','seif@gmail.com','Software Engineer','IT')
go

select *from Employees
go
-- update:
update Employees
set Job = 'Senior Developer'
where empID = 3
go

-- delete:
delete employees where empName = 'Yassin'
go
-- truncate:
truncate table Employees
go


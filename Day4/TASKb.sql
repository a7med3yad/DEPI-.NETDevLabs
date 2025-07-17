use TaskBDB
create table Movies(
id int primary key,
title varchar(100) not null,
rate varchar(100) ,
)

create table MovieThreaters(
Code int primary key,
name varchar(100),
movie int null,
FOREIGN KEY (movie) REFERENCES Movies(id)
)

INSERT INTO Movies(id, title, rate) VALUES
(1, 'Inception', 'PG-13'),
(2, 'The Matrix', NULL),         
(3, 'Interstellar', 'PG-13'),
(4, 'The Godfather', NULL),      
(5, 'Avatar', 'PG-13'),
(6, 'Fight Club', 'R');

INSERT INTO MovieThreaters(Code, name, movie) VALUES
(101, 'Cineplex', 1),
(102, 'IMAX Cinema', 3),
(103, 'Dreamland Theater', 5);


INSERT INTO MovieThreaters(Code, name, movie) VALUES
(104, 'Rotana Cinema', null),
(105,'MBC 2',null)

Go
CREATE TABLE Departments (
    Code INTEGER PRIMARY KEY NOT NULL,
    Name varchar(50) NOT NULL,
    Budget REAL NOT NULL
);

Go

CREATE TABLE Employees (
    SSN INTEGER PRIMARY KEY NOT NULL,
    Name varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
    Department INTEGER NOT NULL,
    CONSTRAINT fk_Departments_Code FOREIGN KEY(Department)
    REFERENCES Departments(Code)
);

Go


INSERT INTO Departments(Code, Name, Budget) VALUES(14, 'IT', 65000);
INSERT INTO Departments(Code, Name, Budget) VALUES(37, 'Accounting', 15000);
INSERT INTO Departments(Code, Name, Budget) VALUES(59, 'Human Resources', 240000);
INSERT INTO Departments(Code, Name, Budget) VALUES(77, 'Research', 55000);

INSERT INTO Employees(SSN, Name, LastName, Department) VALUES('123234877', 'Michael', 'Rogers', 14);
INSERT INTO Employees(SSN, Name, LastName, Department) VALUES('152934485', 'Anand', 'Manikutty', 14);
INSERT INTO Employees(SSN, Name, LastName, Department) VALUES('222364883', 'Carol', 'Smith', 37);
INSERT INTO Employees(SSN, Name, LastName, Department) VALUES('326587417', 'Joe', 'Stevens', 37);
INSERT INTO Employees(SSN, Name, LastName, Department) VALUES('332154719', 'Mary-Anne', 'Foster', 14);
INSERT INTO Employees(SSN, Name, LastName, Department) VALUES('332569843', 'George', 'O''Donnell', 77);
INSERT INTO Employees(SSN, Name, LastName, Department) VALUES('546523478', 'John', 'Doe', 59);
INSERT INTO Employees(SSN, Name, LastName, Department) VALUES('613214882', 'David', 'Smith', 77);
INSERT INTO Employees(SSN, Name, LastName, Department) VALUES('654873219', 'Zacary', 'Efron', 59);
INSERT INTO Employees(SSN, Name, LastName, Department) VALUES('745685214', 'Eric', 'Goldsmith', 59);
INSERT INTO Employees(SSN, Name, LastName, Department) VALUES('845657245', 'Elizabeth', 'Doe', 14);
INSERT INTO Employees(SSN, Name, LastName, Department) VALUES('845657246', 'Kumar', 'Swamy', 14);

Go

--1:
select title from Movies

--2:
select distinct lastname from Employees

--3:
select * from movies where rate is null

--4:
select *from MovieThreaters where movie is null


--5:
select mt.*,m.rate,m.title from MovieThreaters mt
left join Movies m
on m.id = mt.movie


--6:
select m.*,mt.Code [Threaters code],mt.name[Threaters name] from Movies m
left  join MovieThreaters mt 
on mt.movie = m.id


--7:
SELECT m.title
FROM movies m
LEFT JOIN MovieThreaters c ON m.id = c.movie
WHERE c.movie IS NULL;

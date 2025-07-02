-- استخدام قاعدة بيانات Northwind
USE Northwind;
GO

-- تعريف متغيرات واستخدامها
DECLARE @age INT = 30;
SELECT @age;

DECLARE @date DATETIME = GETDATE();
SELECT @date;

-- العلاقات بين الجداول:
-- 1. One to One
-- 2. One to Many
-- 3. Many to Many

-- شرح بنية جملة SELECT:
-- SELECT [columns]
-- FROM [table]
-- WHERE [condition]
-- GROUP BY [columns]
-- HAVING [condition]
-- ORDER BY [columns]

-- أمثلة على استخدام SELECT و WHERE
SELECT * FROM Employees;
SELECT * FROM Employees WHERE EmployeeID = 1;

-- استخدام PRINT
PRINT 'Ahmed';
PRINT 5 + 10;
PRINT 5 + '10';       -- الناتج 15، لأن '10' تُحوّل إلى رقم
PRINT '5' + '10';     -- الناتج '510'، تجميع نصي

-- استخدام alias مع SELECT
SELECT 'Ahmed Ayad' AS FullName;
SELECT 'Ahmed Ayad' FullName;

-- طريقة غير شائعة لكن شغالة:
SELECT FullName = 'Ahmed Ayad';

-- --------------------------------------------------------
-- تصنيفات أوامر SQL:

-- DDL (Data Definition Language): تتعامل مع الهيكل
-- CREATE, ALTER, DROP, TRUNCATE

-- DML (Data Manipulation Language): تتعامل مع البيانات
-- SELECT, INSERT, UPDATE, DELETE

-- DCL (Data Control Language): تتعامل مع الصلاحيات
-- GRANT, DENY, REVOKE

-- DQL (Data Query Language): تركز على الاستعلام فقط
-- SELECT
-- --------------------------------------------------------

-- دمج الاسم الأول والاسم الأخير:
SELECT FirstName + ' ' + LastName AS FullName FROM Employees;

-- إنشاء قاعدة بيانات جديدة
CREATE DATABASE CompanyDB;
GO

-- استخدام قاعدة البيانات الجديدة
USE CompanyDB;
GO

-- إنشاء جدول الموظفين
CREATE TABLE tblEmployees (
    EmployeeId INT PRIMARY KEY IDENTITY,
    FullName NVARCHAR(30) NOT NULL,
    Email VARCHAR(100),
    Mobile VARCHAR(11),
    Job NVARCHAR(50),
    Age TINYINT
);
GO

-- تعديل الجدول: إضافة عمود
ALTER TABLE tblEmployees ADD DOB DATETIME;

-- حذف العمود
ALTER TABLE tblEmployees DROP COLUMN DOB;

-- إدخال بيانات
INSERT INTO tblEmployees (FullName, Email, Mobile, Job, Age)
VALUES 
    ('Ahmed Ayad', 'ahmed@gmail.com', '0120754910', 'Killer', 21);

-- إدخال بيانات جزئية (بعض الأعمدة فقط)
INSERT INTO tblEmployees (FullName, Job, Age)
VALUES 
    ('3yad', 'DR', 26);
GO

-- تعديل اسم العمود من jop إلى job
EXEC sp_rename 'tblEmployees.jop', 'job', 'COLUMN';
GO

-- عرض كل البيانات
SELECT * FROM tblEmployees;

-- إدخال عدة صفوف دفعة واحدة
INSERT INTO tblEmployees (FullName, Email, Mobile, Job, Age)
VALUES 
    ('fares', 'fares@gmail.com', '45454545', 'Killer', 25),
    ('mai', 'mai@gmail.com', '565565', 'data scientist', 26),
    ('mariem', 'mariem@gmail.com', '88888', 'software engineering', 27),
    ('youssef', 'youssef@gmail.com', '77777', 'data engineer', 28),
    ('eyad', 'eyad@gmail.com', '9999', 'teacher', 29);

-- إدخال صف مع تحديد IDENTITY (يتطلب تفعيل خيار مؤقت)
SET IDENTITY_INSERT dbo.tblEmployees ON;

INSERT INTO tblEmployees (EmployeeID, FullName, Email, Mobile, Job, Age)
VALUES (10, 'mahdy', 'mahdy@yahoo.com', '012354687', 'Developer', 40);

SET IDENTITY_INSERT dbo.tblEmployees OFF;

-- التحقق من البيانات
SELECT * FROM tblEmployees;

-- إدخال صف جديد بدون IDENTITY
INSERT INTO tblEmployees (FullName, Email, Mobile, Job, Age)
VALUES ('Sayed Hawas', 'Sayed@yahoo.com', '012354687', 'Developer', 40);

-- أمثلة على المتغيرات بأنواع مختلفة:
DECLARE @name VARCHAR(30);
SET @name = 'Ahmed';
SELECT @name;
GO

DECLARE @age INT;
SET @age = 21;
SELECT @age;
GO

DECLARE @school NCHAR(50);
SET @school = 'Mohamed Nageeb Language School';
SELECT @school;
GO

DECLARE @Name NVARCHAR(4000);
SET @Name = 'Ahmed Ayad';
SELECT @Name;
GO

-- مثال على المتغير من نوع DECIMAL
DECLARE @x DECIMAL(9,2);
SET @x = 123.55;
SELECT @x;

-- استخدام sp_help لعرض معلومات عن نوع بيانات
EXEC sp_help 'varchar';
EXEC sp_help 'nvarchar';

-- مراجعة البيانات النهائية
SELECT * FROM tblEmployees;

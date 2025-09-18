# SQL Tasks Basic level tasks (10)

CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);


-- Способ 1: одиночная вставка с указанием колонок
INSERT INTO Employees (EmpID, Name, Salary)
VALUES (1, 'Alice', 6000.00);

-- Способ 2: одиночная вставка без указания колонок (значения должны быть по порядку)
INSERT INTO Employees
VALUES (2, 'Bob', 5000.00);

-- Способ 3: множественная вставка
INSERT INTO Employees (EmpID, Name, Salary)
VALUES 
(3, 'Charlie', 5500.00),
(4, 'Diana', 6200.00);



UPDATE Employees
SET Salary = 7000
WHERE EmpID = 1;





DELETE FROM Employees
WHERE EmpID = 2;


Разница между DELETE, TRUNCATE и DROP

DELETE — удаляет строки по условию (WHERE), можно откатить через транзакцию, структура остаётся.

TRUNCATE — быстро удаляет все строки из таблицы, структура остаётся, откатить нельзя (минимальное логирование).

DROP — полностью удаляет таблицу (и данные, и структуру).


ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);



ALTER TABLE Employees
ADD Department VARCHAR(50);


ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;


CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);


TRUNCATE TABLE Employees;

# SQL Tasks Intermediate level tasks (6)

-- Создадим временную таблицу с тестовыми данными
CREATE TABLE TempDepartments (DepartmentID INT, DepartmentName VARCHAR(50));

INSERT INTO TempDepartments VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'Sales');

-- Вставляем данные в Departments с помощью INSERT INTO SELECT
INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT DepartmentID, DepartmentName FROM TempDepartments;

-- Удаляем временную таблицу
DROP TABLE TempDepartments;

UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;


TRUNCATE TABLE Employees;


ALTER TABLE Employees
DROP COLUMN Department;

EXEC sp_rename 'Employees', 'StaffMembers';

DROP TABLE Departments;

# SQL Tasks Advenced level tasks (9)
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Description VARCHAR(200)
);


ALTER TABLE Products
ADD CONSTRAINT chk_price CHECK (Price > 0);



ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;


EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';


INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Description)
VALUES 
(1, 'Laptop', 'Electronics', 1200.00, 'Business laptop'),
(2, 'Smartphone', 'Electronics', 800.00, 'Latest model'),
(3, 'Chair', 'Furniture', 150.00, 'Office chair'),
(4, 'Book', 'Stationery', 20.00, 'Programming guide'),
(5, 'Headphones', 'Electronics', 100.00, 'Noise cancelling');

SELECT *
INTO Products_Backup
FROM Products;


EXEC sp_rename 'Products', 'Inventory';

ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;

ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000,5);




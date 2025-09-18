# SQL Easy level tasks (10)


Определение и назначение BULK INSERT

BULK INSERT в SQL Server — это команда для быстрой загрузки больших объёмов данных (bulk data) из внешних файлов (например, .txt или .csv) в таблицы базы данных.
👉 Основная цель — ускорить процесс импорта по сравнению с построчными INSERT.

Пример:
Определение и назначение BULK INSERT

BULK INSERT в SQL Server — это команда для быстрой загрузки больших объёмов данных (bulk data) из внешних файлов (например, .txt или .csv) в таблицы базы данных.
👉 Основная цель — ускорить процесс импорта по сравнению с построчными INSERT.

2. Четыре формата файлов, которые можно импортировать в SQL Server

CSV (Comma Separated Values)

TXT (Text files)

XLS/XLSX (Excel)

XML (Extensible Markup Language)

(Также поддерживаются JSON, но чаще через OPENROWSET или SSIS.)

3. CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);
4. INSERT INTO Products (ProductID, ProductName, Price)
VALUES
(1, 'Laptop', 1200.00),
(2, 'Smartphone', 800.00),
(3, 'Headphones', 150.00);

5. Разница между NULL и NOT NULL

NULL = отсутствие значения (пустое поле, неизвестное значение).

NOT NULL = обязательно должно быть указано значение, пустое поле запрещено.

Пример:
UserName VARCHAR(50) NOT NULL,  -- всегда должно быть значение
Email VARCHAR(100) NULL         -- можно оставить пустым
  
6. Добавить UNIQUE на ProductName
ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);

7. Комментарий в SQL-запросе
-- Этот запрос выводит все товары из таблицы Products
SELECT * FROM Products;

8. Добавить колонку CategoryID
ALTER TABLE Products
ADD CategoryID INT;

9. Создать таблицу Categories
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);

0. Назначение IDENTITY в SQL Server

IDENTITY — это свойство столбца, которое автоматически генерирует уникальные числовые значения при вставке новых строк.

Начинает с заданного числа (seed)

Увеличивается на определённый шаг (increment)

Пример:
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,  -- начинается с 1, шаг = 1
    OrderDate DATETIME DEFAULT GETDATE()
);


# SQL Medium level tasks (10)


-- Импорт данных из текстового файла в таблицу Products
BULK INSERT Products
FROM 'C:\Data\products.txt'
WITH (
    FIELDTERMINATOR = ',',   -- разделитель значений
    ROWTERMINATOR = '\n',    -- разделитель строк
    FIRSTROW = 2             -- пропустить строку с заголовками
);

ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);


Различия между PRIMARY KEY и UNIQUE KEY
Свойство	PRIMARY KEY	UNIQUE KEY
Количество в таблице	Только 1	Может быть несколько
NULL значения	Не допускаются	Разрешено одно значение NULL
Индекс	Создаёт кластерный индекс (по умолчанию)	Создаёт некластерный индекс
Назначение	Уникальный идентификатор строки	Уникальные значения в столбце


ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive CHECK (Price > 0);



ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;



SELECT 
    ProductID,
    ProductName,
    ISNULL(Price, 0) AS Price,
    CategoryID,
    Stock
FROM Products;



Назначение и использование FOREIGN KEY в SQL Server

FOREIGN KEY — это ограничение, которое создаёт связь между двумя таблицами.

Оно гарантирует, что значение в дочерней таблице (например, Products.CategoryID) должно существовать в родительской таблице (например, Categories.CategoryID).

Таким образом обеспечивается ссылочная целостность данных.

Пример:

Таблица Categories хранит список категорий товаров.

Таблица Products хранит товары и содержит столбец CategoryID.

FOREIGN KEY не позволит вставить товар с несуществующей категорией.


# SQL Hard level tasks (10)


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Age INT CHECK (Age >= 18)   -- ограничение: возраст не меньше 18
);


CREATE TABLE Products (
    ProductID INT IDENTITY(100,10) PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2)
);


CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);


ISNULL(expression, replacement) → replaces NULL with the specified replacement. Works with two arguments only.
Example:
SELECT ISNULL(NULL, 'N/A'); -- Returns 'N/A'


COALESCE(expression1, expression2, ..., expressionN) → returns the first non-NULL value from a list. Works with multiple arguments.
Example:

SELECT COALESCE(NULL, NULL, 'Value', 'Other'); -- Returns 'Value'


Create an Employees table with PRIMARY KEY on EmpID and UNIQUE KEY on Email
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    HireDate DATE
);
Create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
If a Customer is deleted → their Orders are deleted automatically.

If a CustomerID is updated → it cascades to Orders.


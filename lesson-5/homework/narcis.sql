# SQL Task Easy

SELECT ProductName AS Name
FROM Products;


SELECT *
FROM Customers AS Client;


SELECT ProductName
FROM Products
UNION
SELECT ProductName
FROM Products_Discounted;


SELECT ProductName
FROM Products
INTERSECT
SELECT ProductName
FROM Products_Discounted;


SELECT DISTINCT CustomerName, Country
FROM Customers;





SELECT ProductName,
       Price,
       CASE 
           WHEN Price > 1000 THEN 'High'
           ELSE 'Low'
       END AS PriceCategory
FROM Products;



SELECT ProductName,
       StockQuantity,
       IIF(StockQuantity > 100, 'Yes', 'No') AS InStock
FROM Products_Discounted;




SELECT ProductName
FROM Products
UNION
SELECT ProductName
FROM Products_Discounted;



SELECT ProductName
FROM Products
EXCEPT
SELECT ProductName
FROM Products_Discounted;


SELECT ProductName,
       Price,
       IIF(Price > 1000, 'Expensive', 'Affordable') AS PriceCategory
FROM Products;




SELECT *
FROM Employees
WHERE Age < 25
   OR Salary > 60000;



UPDATE Employees
SET Salary = Salary * 1.10
WHERE DepartmentName = 'HR'
   OR EmpID = 5;

# SQL Task Hard


SELECT 
    SaleID,
    CustomerID,
    SaleAmount,
    CASE 
        WHEN SaleAmount > 500 THEN 'Top Tier'
        WHEN SaleAmount BETWEEN 200 AND 500 THEN 'Mid Tier'
        ELSE 'Low Tier'
    END AS SaleTier
FROM Sales;



SELECT DISTINCT CustomerID
FROM Orders

EXCEPT

SELECT DISTINCT CustomerID
FROM Sales;
CASE discount percentage based on quantity (from Orders)

You mentioned the rules:

1 item → 3%

Between 1 and 3 items → 5%

Otherwise → 7%

⚠ Small note: "1 item: 3%" and "Between 1 and 3 items: 5%" overlap.
I’ll interpret it as:

Exactly 1 item → 3%

2–3 items → 5%

>3 items → 7%


SELECT 
    CustomerID,
    Quantity,
    CASE 
        WHEN Quantity = 1 THEN 3
        WHEN Quantity BETWEEN 2 AND 3 THEN 5
        ELSE 7
    END AS DiscountPercentage
FROM Orders;


This outputs each order’s CustomerID, Quantity, and the calculated discount.




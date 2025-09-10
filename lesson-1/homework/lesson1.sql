Task 1 
Easy
Data – facts, figures, or any information that can be stored and processed.

Database – an organized collection of data where information is stored and managed.

Relational database – a database in which data is stored in related tables (relations).

Table – a structure in a database consisting of rows (records) and columns (fields) where data is stored.
 Five key features of SQL Server:

High performance and scalability.

Support for transactions and data integrity.

Backup and recovery options.

Support for stored procedures, triggers, and functions.

Integration with Business Intelligence (BI) and reporting tools.
 Authentication modes available when connecting to SQL Server (at least two):

Windows Authentication – uses a Windows account.

SQL Server Authentication – uses a login and password created in SQL Server.
Task2 
CREATE DATABASE SchoolDB;
USE SchoolDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);
Differences between SQL Server, SSMS, and SQL

SQL (Structured Query Language):
A programming/query language used to communicate with databases. It allows you to create, read, update, and delete data (CRUD operations).

SQL Server:
A relational database management system (RDBMS) developed by Microsoft. It stores and manages data, processes SQL commands, and provides security, backup, and transaction management.

SSMS (SQL Server Management Studio):
A graphical user interface (GUI) tool provided by Microsoft to work with SQL Server. It makes it easier to write SQL queries, manage databases, configure security, and monitor performance.

In short:

SQL → the language.

SQL Server → the database engine.

SSMS → the tool to interact with SQL Server using SQL.

 Task3
Hard
SQL Command Categories

SQL commands are divided into five main categories:

1. DQL (Data Query Language)

Used to query (retrieve) data.

Command: SELECT

Example:
 SELECT Name, Age FROM Students;
DML (Data Manipulation Language)

Used to modify data inside tables.

Commands: INSERT, UPDATE, DELETE

Examples:-- Insert a new student
INSERT INTO Students (StudentID, Name, Age)
VALUES (1, 'Alice', 20);

-- Update data
UPDATE Students
SET Age = 21
WHERE StudentID = 1;

-- Delete a record
DELETE FROM Students
WHERE StudentID = 1;
DDL (Data Definition Language)

Used to define or change database structures.

Commands: CREATE, ALTER, DROP, TRUNCATE

Examples:
-- Create a table
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    Name VARCHAR(50)
);

-- Alter a table (add a new column)
ALTER TABLE Students
ADD Grade VARCHAR(5);

-- Drop a table
DROP TABLE Teachers;


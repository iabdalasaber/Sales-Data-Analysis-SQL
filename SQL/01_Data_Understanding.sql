--1. SQL Analysis — Questions & Answers

--Phase 1 — Data Understanding
--Q1. How many customers are in the database?

SELECT COUNT(*) AS TotalCustomers
FROM Customers;

--Q2. How many products are available?

SELECT COUNT(*) AS TotalProducts
FROM Products;

--Q3. How many orders are in the database?

SELECT COUNT(*) AS TotalOrders
FROM Orders;

--Q4. What are the minimum and maximum customer creation dates?

SELECT
    MIN(CreatedAt) AS FirstCustomerDate,
    MAX(CreatedAt) AS LastCustomerDate
FROM Customers;

--Q5. What cities do the customers come from?

SELECT DISTINCT City
FROM Customers
ORDER BY City;

--Q6. What product categories are available?

SELECT DISTINCT Category
FROM Products
ORDER BY Category;

--Q7. What order statuses are available?

SELECT DISTINCT OrderStatus
FROM Orders
ORDER BY OrderStatus;
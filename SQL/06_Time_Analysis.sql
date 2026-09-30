-- Phase 6 — Time Analysis

-------- Q38. What is the total revenue generated each month?


SELECT
    YEAR(O.OrderDate) AS OrderYear,
    MONTH(O.OrderDate) AS OrderMonth,
    SUM(OD.Quantity * OD.UnitPrice) AS TotalRevenue
FROM Orders O
JOIN OrderDetails OD
    ON O.OrderId = OD.OrderId
WHERE O.OrderStatus = 'Completed'
GROUP BY
    YEAR(O.OrderDate),
    MONTH(O.OrderDate)
ORDER BY
    OrderYear,
    OrderMonth;


-------- Q39. How many completed orders were placed each month?


SELECT
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth,
    COUNT(*) AS CompletedOrders
FROM Orders
WHERE OrderStatus = 'Completed'
GROUP BY
    YEAR(OrderDate),
    MONTH(OrderDate)
ORDER BY
    OrderYear,
    OrderMonth;


-------- Q40. Which month generated the highest revenue?


SELECT TOP 1
    YEAR(O.OrderDate) AS OrderYear,
    MONTH(O.OrderDate) AS OrderMonth,
	DATENAME(MONTH,O.OrderDate) AS OrderMonthName,
    SUM(OD.Quantity * OD.UnitPrice) AS TotalRevenue
FROM Orders O
JOIN OrderDetails OD
    ON O.OrderId = OD.OrderId
WHERE O.OrderStatus = 'Completed'
GROUP BY
    YEAR(O.OrderDate),
    MONTH(O.OrderDate),
	DATENAME(MONTH,O.OrderDate)
ORDER BY TotalRevenue DESC;


---
-- Phase 5 — Customer Analysis

-------- Q33. How many orders has each customer placed?


SELECT
    C.CustomerId,
    C.CustomerName,
    COUNT(DISTINCT O.OrderId) AS TotalOrders
FROM Customers C
LEFT JOIN Orders O
    ON C.CustomerId = O.CustomerId
GROUP BY
    C.CustomerId,
    C.CustomerName
ORDER BY TotalOrders DESC;


-------- Q34. How much revenue has each customer generated?


SELECT
    C.CustomerId,
    C.CustomerName,
    SUM(OD.Quantity * OD.UnitPrice) AS TotalRevenue
FROM Customers C
JOIN Orders O
    ON C.CustomerId = O.CustomerId
JOIN OrderDetails OD
    ON O.OrderId = OD.OrderId
WHERE O.OrderStatus = 'Completed'
GROUP BY
    C.CustomerId,
    C.CustomerName
ORDER BY TotalRevenue DESC;


-------- Q35. Who are the top 5 customers by revenue?


SELECT TOP 5
    C.CustomerId,
    C.CustomerName,
    SUM(OD.Quantity * OD.UnitPrice) AS TotalRevenue
FROM Customers C
JOIN Orders O
    ON C.CustomerId = O.CustomerId
JOIN OrderDetails OD
    ON O.OrderId = OD.OrderId
WHERE O.OrderStatus = 'Completed'
GROUP BY
    C.CustomerId,
    C.CustomerName
ORDER BY TotalRevenue DESC;


-------- Q36. How many customers have never placed an order?


SELECT COUNT(*) AS CustomersWithoutOrders
FROM Customers C
LEFT JOIN Orders O
    ON C.CustomerId = O.CustomerId
WHERE O.OrderId IS NULL;


-------- Q37. What is the average revenue generated per customer?


SELECT
    AVG(CustomerRevenue) AS AverageCustomerRevenue
FROM
(
    SELECT
        C.CustomerId,
        COALESCE(SUM(OD.Quantity * OD.UnitPrice), 0) AS CustomerRevenue
    FROM Customers C
    LEFT JOIN Orders O
        ON C.CustomerId = O.CustomerId
       AND O.OrderStatus = 'Completed'
    LEFT JOIN OrderDetails OD
        ON O.OrderId = OD.OrderId
    GROUP BY C.CustomerId
) X;


---

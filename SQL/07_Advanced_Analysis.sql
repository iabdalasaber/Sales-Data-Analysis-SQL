-- Phase 7 — Advanced Analysis

-------- Q41. What is the revenue ranking of each customer?


SELECT
    CustomerId,
    CustomerName,
    TotalRevenue,
    RANK() OVER (ORDER BY TotalRevenue DESC) AS RevenueRank
FROM
(
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
) X
ORDER BY RevenueRank;


-------- Q42. What is the number of days between each customer's orders?


WITH CustomerOrders AS
(
    SELECT
        C.CustomerId,
        C.CustomerName,
        O.OrderDate,
        LAG(O.OrderDate) OVER
        (
            PARTITION BY C.CustomerId
            ORDER BY O.OrderDate
        ) AS PreviousOrderDate
    FROM Customers C
    JOIN Orders O
        ON C.CustomerId = O.CustomerId
)
SELECT
    CustomerId,
    CustomerName,
    OrderDate,
    PreviousOrderDate,
    DATEDIFF(DAY, PreviousOrderDate, OrderDate) AS DaysBetweenOrders
FROM CustomerOrders
ORDER BY
    CustomerId,
    OrderDate;


-------- Q43. What is the running total of revenue for each customer over time?


WITH OrderTotals AS
(
    SELECT
        C.CustomerId,
        C.CustomerName,
        O.OrderId,
        O.OrderDate,
        SUM(OD.Quantity * OD.UnitPrice) AS OrderTotal
    FROM Customers C
    JOIN Orders O
        ON C.CustomerId = O.CustomerId
    JOIN OrderDetails OD
        ON O.OrderId = OD.OrderId
    WHERE O.OrderStatus = 'Completed'
    GROUP BY
        C.CustomerId,
        C.CustomerName,
        O.OrderId,
        O.OrderDate
)
SELECT
    CustomerId,
    CustomerName,
    OrderId,
    OrderDate,
    OrderTotal,
    SUM(OrderTotal) OVER
    (
        PARTITION BY CustomerId
        ORDER BY OrderDate, OrderId
    ) AS RunningRevenue
FROM OrderTotals
ORDER BY
    CustomerId,
    OrderDate,
    OrderId;


---

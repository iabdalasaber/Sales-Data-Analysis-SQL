-- Phase 2 — Data Quality

------ Customers

-------- Q8. Are there any customers with a birth date in the future?


SELECT *
FROM Customers
WHERE BirthDate > CAST(GETDATE() AS DATE);


-------- Q9. Are there any customers with missing names?


SELECT *
FROM Customers
WHERE CustomerName IS NULL;


-------- Q10. Are there any customers with missing cities?


SELECT *
FROM Customers
WHERE City IS NULL;


-------- Q11. Are there any customers with invalid gender values?


SELECT DISTINCT Gender
FROM Customers
WHERE Gender IS NOT NULL
  AND Gender NOT IN ('M', 'F');


------ Products

-------- Q12. Are there products with negative stock quantities?


SELECT *
FROM Products
WHERE StockQuantity < 0;


-------- Q13. Are there products with zero or negative prices?


SELECT *
FROM Products
WHERE Price <= 0;


-------- Q14. Are there products with missing categories?


SELECT *
FROM Products
WHERE Category IS NULL;


------ Orders

-------- Q15. Are there orders with missing customer IDs?


SELECT *
FROM Orders
WHERE CustomerId IS NULL;


-------- Q16. Are there orders with missing order dates?


SELECT *
FROM Orders
WHERE OrderDate IS NULL;


-------- Q17. Are there orders with invalid statuses?


SELECT DISTINCT OrderStatus
FROM Orders
WHERE OrderStatus IS NOT NULL
  AND OrderStatus NOT IN ('Completed', 'Pending', 'Cancelled');


------ Order Details

-------- Q18. Are there order details with missing product IDs?


SELECT *
FROM OrderDetails
WHERE ProductId IS NULL;


-------- Q19. Are there order details with invalid quantities?


SELECT *
FROM OrderDetails
WHERE Quantity <= 0;


-------- Q20. Are there order details with invalid unit prices?


SELECT *
FROM OrderDetails
WHERE UnitPrice <= 0;

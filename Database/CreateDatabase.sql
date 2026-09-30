CREATE DATABASE SalesDataAnalysis;
GO

USE SalesDataAnalysis;
GO

CREATE TABLE Customers
(
    CustomerId INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName NVARCHAR(200) NOT NULL,
    City NVARCHAR(100) NULL,
    Gender CHAR(1) NULL,
    BirthDate DATE NULL,
    CreatedAt DATE NULL
);
GO

CREATE TABLE Products
(
    ProductId INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(200) NOT NULL,
    Category NVARCHAR(100) NULL,
    Price DECIMAL(10,2) NULL,
    StockQuantity INT NULL
);
GO

CREATE TABLE Orders
(
    OrderId INT PRIMARY KEY,
    CustomerId INT NULL,
    OrderDate DATE NULL,
    OrderStatus NVARCHAR(60) NULL
);
GO

CREATE TABLE OrderDetails
(
    OrderDetailId INT PRIMARY KEY,
    OrderId INT NULL,
    ProductId INT NULL,
    Quantity INT NULL,
    UnitPrice DECIMAL(10,2) NULL
);
GO

ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Customers
FOREIGN KEY (CustomerId)
REFERENCES Customers(CustomerId);
GO

ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_Orders
FOREIGN KEY (OrderId)
REFERENCES Orders(OrderId);
GO

ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_Products
FOREIGN KEY (ProductId)
REFERENCES Products(ProductId);
GO
# Sales Data Analysis — SQL Server

## Project Overview

This project analyzes transactional sales data using **SQL Server and T-SQL** to extract business insights related to sales performance, products, customers, inventory, and time-based trends.

The project follows a practical data analysis workflow:

**Data Understanding → Data Quality → Business Analysis → Insights**

---

## Business Objective

The main objective is to use sales data to answer practical business questions and provide measurable insights.

The analysis focuses on:

* Measuring overall sales performance
* Calculating key business KPIs
* Identifying high-performing products
* Analyzing customer revenue and order activity
* Analyzing monthly sales trends
* Evaluating inventory
* Identifying products that have never been sold
* Detecting data quality issues

---

## Dataset

The database contains four relational tables:

### Customers

Contains customer information such as:

* Customer ID
* Customer Name
* City
* Gender
* Birth Date
* Customer Creation Date

### Products

Contains product information such as:

* Product ID
* Product Name
* Category
* Price
* Stock Quantity

### Orders

Contains order-level information such as:

* Order ID
* Customer ID
* Order Date
* Order Status

### OrderDetails

Contains individual items within each order:

* Order Detail ID
* Order ID
* Product ID
* Quantity
* Unit Price

---

## Tools & Technologies

* **SQL Server**
* **T-SQL**
* **SQL Server Management Studio (SSMS)**
* **Git**
* **GitHub**

---

## SQL Techniques Used

The project applies several SQL techniques, including:

* SELECT
* WHERE
* DISTINCT
* ORDER BY
* JOIN
* LEFT JOIN
* GROUP BY
* HAVING
* Aggregate Functions
* Subqueries
* Common Table Expressions (CTEs)
* Window Functions
* RANK
* LAG
* Date Functions
* Data Quality Validation

---

## Analysis Performed

### 1. Data Understanding

Initial exploration of:

* Number of customers
* Number of products
* Number of orders
* Customer date ranges
* Available cities
* Product categories
* Order statuses

### 2. Data Quality Analysis

The dataset was checked for:

* Missing values
* Invalid gender values
* Future birth dates
* Negative stock quantities
* Invalid product prices
* Missing customer references
* Missing order dates
* Invalid order statuses
* Invalid quantities
* Invalid unit prices

### 3. Sales Analysis

The analysis includes:

* Total revenue
* Completed orders
* Average Order Value
* Total quantity sold
* Revenue by order
* Monthly revenue

### 4. Product Analysis

The analysis includes:

* Revenue by product
* Top products by revenue
* Quantity sold by product
* Inventory value
* Inventory value by category
* Low-stock products
* Products that have never been sold

### 5. Customer Analysis

The analysis includes:

* Orders per customer
* Revenue per customer
* Top customers by revenue
* Customers without orders
* Average customer revenue
* Customer revenue ranking
* Time between customer orders
* Running revenue per customer

### 6. Time Analysis

The project analyzes:

* Monthly revenue
* Monthly completed orders
* Highest-revenue month

---

## Key KPIs

| KPI                 |         Result |
| ------------------- | -------------: |
| Total Revenue       | 179,104,242.15 |
| Completed Orders    |          2,252 |
| Average Order Value |      53,339.80 |
| Total Quantity Sold |         33,044 |
| Total Customers     |            300 |
| Total Products      |            120 |

### Top Customer

**Mariam Adel**

* Customer ID: `15`
* Total Revenue: **6,170,563.30**

### Top Product

**Laptop**

* Product ID: `1`
* Category: `Electronics`
* Price: **25,000.00**
* Total Revenue: **60,282,500.00**

### Best Revenue Month

**August 2026**

* Revenue: **4,650,955.05**

---

## Key Business Insights

* The dataset generated **179.1 million** in revenue from completed orders.
* There were **2,252 completed orders** with an average order value of approximately **53.3K**.
* A total of **33,044 product units** were sold through completed orders.
* **Mariam Adel** generated the highest customer revenue with **6.17 million**.
* **Laptop** generated the highest product revenue with **60.28 million**.
* **August 2026** recorded the highest monthly revenue with **4.65 million**.

These findings provide a starting point for deeper analysis of product categories, customer behavior, inventory, and sales trends.

---

## Data Quality Findings

The data quality assessment identified **14 problematic records** across the dataset.

| Issue                                    | Records |
| ---------------------------------------- | ------: |
| Customers with missing cities            |       2 |
| Products with negative stock             |       1 |
| Orders with missing dates                |       6 |
| Order details with invalid quantities    |       3 |
| Order details with invalid unit prices   |       2 |
| **Total identified problematic records** |  **14** |

Most other validation checks returned no issues.

One important finding is that **4 completed orders have missing order dates**, which affects their ability to be assigned to a specific month during time-based analysis.

Invalid quantities and unit prices were also identified because they can affect revenue calculations.

Detailed findings are available in:

`Documentation/Data_Quality_Report.md`

---

## Project Structure

```text
Sales-Data-Analysis-SQL/
│
├── README.md
│
├── Database/
│   ├── CreateDatabase.sql
│   └── InsertData.sql
│
├── SQL/
│   ├── 01_Data_Understanding.sql
│   ├── 02_Data_Quality.sql
│   ├── 03_Sales_Analysis.sql
│   ├── 04_Product_Analysis.sql
│   ├── 05_Customer_Analysis.sql
│   ├── 06_Time_Analysis.sql
│   └── 07_Advanced_Analysis.sql
│
└── Documentation/
    ├── Business_Insights.md
    └── Data_Quality_Report.md
```

---

## How to Run the Project

### 1. Create the Database

Open **SQL Server Management Studio** and execute:

```text
Database/CreateDatabase.sql
```

This creates the database structure and relationships.

### 2. Insert the Data

Execute:

```text
Database/InsertData.sql
```

This populates the database with the project dataset.

### 3. Run the Analysis

Open the SQL files under:

```text
SQL/
```

and execute the queries to reproduce the analysis.

### 4. Review the Documentation

Detailed findings are available in:

```text
Documentation/Business_Insights.md
Documentation/Data_Quality_Report.md
```

---

## Conclusion

This project demonstrates a practical SQL Server data analysis workflow, starting from data exploration and quality validation and progressing to business-focused analysis and insights.

It demonstrates the use of SQL to transform transactional data into meaningful information that can support business reporting and decision-making.

# Business Insights

## 1. Project Objective

The objective of this project is to analyze sales data using SQL Server and identify key business insights related to sales performance, products, customers, and time-based trends.

The analysis focuses on completed orders and uses SQL queries to calculate business KPIs and answer practical business questions.

---

## 2. KPI Summary

| KPI                 |         Result |
| ------------------- | -------------: |
| Total Revenue       | 179,104,242.15 |
| Completed Orders    |          2,252 |
| Average Order Value |      53,339.80 |
| Total Quantity Sold |         33,044 |
| Total Customers     |            300 |
| Total Products      |            120 |

### KPI Definitions

* **Total Revenue:** Total revenue generated from completed orders.
* **Completed Orders:** Number of orders with a `Completed` status.
* **Average Order Value (AOV):** Average revenue generated per completed order.
* **Total Quantity Sold:** Total number of product units sold through completed orders.
* **Total Customers:** Number of customers available in the dataset.
* **Total Products:** Number of products available in the dataset.

---

## 3. Sales Performance

The analysis identified the following sales performance results:

* Total revenue generated from completed orders was **179,104,242.15**.
* There were **2,252 completed orders**.
* The average order value was approximately **53,339.80**.
* A total of **33,044 product units** were sold through completed orders.

These metrics provide an overview of the overall sales performance represented in the dataset.

---

## 4. Customer Performance

The customer analysis identified the customer with the highest revenue contribution.

### Top Customer by Revenue

| Customer ID | Customer Name | Total Revenue |
| ----------: | ------------- | ------------: |
|          15 | Mariam Adel   |  6,170,563.30 |

**Mariam Adel** generated the highest total revenue among customers in the dataset, with **6,170,563.30** in completed-order revenue.

This metric can be used to identify high-value customers and support further customer segmentation analysis.

---

## 5. Product Performance

The product analysis identified the product generating the highest revenue.

### Top Product by Revenue

| Product ID | Product Name | Category    |     Price | Total Revenue |
| ---------: | ------------ | ----------- | --------: | ------------: |
|          1 | Laptop       | Electronics | 25,000.00 | 60,282,500.00 |

The **Laptop** product generated the highest revenue, with total completed-order revenue of **60,282,500.00**.

This makes the Laptop an important product to consider when analyzing product-level sales performance, inventory, and revenue contribution.

---

## 6. Time Analysis

Monthly sales analysis was used to identify the month with the highest revenue.

### Highest Revenue Month

| Year | Month  |      Revenue |
| ---: | ------ | -----------: |
| 2026 | August | 4,650,955.05 |

**August 2026** recorded the highest monthly revenue in the analyzed dataset, with **4,650,955.05**.

Monthly revenue analysis can help identify changes in sales performance over time and highlight periods that may require further investigation.

---

## 7. Key Business Insights

Based on the analyzed results:

1. The dataset generated **179.1 million** in revenue from completed orders.
2. The business recorded **2,252 completed orders**, with an average order value of approximately **53.3K**.
3. A total of **33,044 product units** were sold through completed orders.
4. **Mariam Adel** was the highest-revenue customer, generating **6.17 million**.
5. **Laptop** was the highest-revenue product, generating **60.28 million**.
6. **August 2026** was the highest-revenue month, generating approximately **4.65 million**.

These findings provide a starting point for deeper analysis of product categories, customer behavior, inventory, and sales trends.

---

## 8. Analysis Areas

The project covers several areas of business analysis:

* Overall sales performance
* Revenue analysis
* Order analysis
* Average order value
* Product performance
* Product revenue
* Product quantity sold
* Inventory value
* Low-stock products
* Unsold products
* Customer order activity
* Customer revenue
* Monthly revenue trends
* Customer revenue ranking
* Customer order intervals
* Running revenue over time

---

## 9. Methodology

The analysis was performed using **SQL Server**.

The project uses relational data from the following tables:

* `Customers`
* `Products`
* `Orders`
* `OrderDetails`

Revenue calculations are based on:

`Quantity × UnitPrice`

Sales performance calculations primarily focus on orders with:

`OrderStatus = 'Completed'`

SQL techniques used throughout the project include:

* SELECT
* WHERE
* JOIN
* LEFT JOIN
* GROUP BY
* HAVING
* Aggregate Functions
* Subqueries
* CTEs
* Window Functions
* Ranking
* Date Functions
* Data Quality Checks

---

## 10. Conclusion

This project demonstrates how SQL Server can be used to transform transactional sales data into business-focused information.

The analysis covers the complete process from understanding the dataset and checking data quality to calculating KPIs and analyzing customers, products, and sales trends.

The results can serve as a foundation for further visualization and reporting using tools such as Power BI.

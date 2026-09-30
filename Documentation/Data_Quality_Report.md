# Data Quality Report

## 1. Overview

A data quality assessment was performed before interpreting the sales analysis results.

The objective was to identify missing values, invalid values, and inconsistent records that could affect business reporting and analytical results.

The assessment covered the following tables:

* `Customers`
* `Products`
* `Orders`
* `OrderDetails`

---

## 2. Data Quality Summary

The analysis identified **14 problematic records** across the dataset.

| Data Quality Issue                       | Affected Records |
| ---------------------------------------- | ---------------: |
| Customers with missing cities            |                2 |
| Products with negative stock             |                1 |
| Orders with missing order dates          |                6 |
| Order details with invalid quantities    |                3 |
| Order details with invalid unit prices   |                2 |
| **Total identified problematic records** |           **14** |

No issues were found for the remaining validation checks.

---

## 3. Customers

### 3.1 Future Birth Dates

**Result:** No customers were found with a birth date in the future.

This indicates that the available birth-date values passed this validation rule.

### 3.2 Missing Customer Names

**Result:** No customers were found with missing names.

### 3.3 Missing Customer Cities

**Result:** 2 customers have missing city information.

| Customer ID | Customer Name | City |
| ----------: | ------------- | ---- |
|          74 | Mariam Hassan | NULL |
|          77 | Hana Ali      | NULL |

The missing city values may affect geographic or city-level customer analysis.

### 3.4 Invalid Gender Values

**Result:** No invalid gender values were found.

The available non-null gender values matched the expected values:

* `M`
* `F`

---

## 4. Products

### 4.1 Negative Stock Quantities

**Result:** 1 product was found with negative stock.

| Product ID | Product Name                | Category            |    Price | Stock Quantity |
| ---------: | --------------------------- | ------------------- | -------: | -------------: |
|        299 | USB Flash Drive Advanced 89 | Computers & Laptops | 2,141.00 |             -2 |

A negative stock quantity may indicate an inventory data-entry or synchronization issue.

This record can affect inventory-related calculations such as total inventory value.

### 4.2 Zero or Negative Prices

**Result:** No products were found with zero or negative prices.

### 4.3 Missing Categories

**Result:** No products were found with missing categories.

---

## 5. Orders

### 5.1 Missing Customer IDs

**Result:** No orders were found with missing customer IDs.

This means the available orders contain customer references.

### 5.2 Missing Order Dates

**Result:** 6 orders were found without an order date.

| Order ID | Customer ID | Order Status |
| -------: | ----------: | ------------ |
|      152 |          88 | Cancelled    |
|      501 |         179 | Completed    |
|      928 |          12 | Completed    |
|     1463 |          29 | Completed    |
|     2032 |          20 | Cancelled    |
|     2689 |         143 | Completed    |

Four of these records have a `Completed` status.

This is important for time-based analysis because completed orders without an order date cannot be assigned to a specific month or year.

### 5.3 Invalid Order Statuses

**Result:** No invalid order statuses were found.

The available statuses matched the expected business values:

* `Completed`
* `Pending`
* `Cancelled`

---

## 6. Order Details

### 6.1 Missing Product IDs

**Result:** No order details were found with missing product IDs.

### 6.2 Invalid Quantities

**Result:** 3 order details contain invalid quantities.

| Order Detail ID | Order ID | Product ID | Quantity | Unit Price |
| --------------: | -------: | ---------: | -------: | ---------: |
|            1479 |      866 |        253 |        0 |   1,537.00 |
|            4408 |     1815 |          2 |       -2 |     450.00 |
|            6964 |     2443 |        226 |        0 |   4,268.00 |

Quantities equal to zero do not represent a valid sale, while a negative quantity may represent a correction, return, or data-entry issue.

These records should be reviewed before using order-detail quantities for business reporting.

### 6.3 Invalid Unit Prices

**Result:** 2 order details contain invalid unit prices.

| Order Detail ID | Order ID | Product ID | Quantity | Unit Price |
| --------------: | -------: | ---------: | -------: | ---------: |
|            3303 |     1474 |          1 |       12 |       0.00 |
|            7715 |     2593 |          9 |       14 |     -25.00 |

Both records contain unit prices that are zero or negative.

Because revenue is calculated using:

`Quantity × UnitPrice`

these records can affect revenue calculations if they are included without validation.

---

## 7. Impact on Analysis

The identified data-quality issues do not all have the same analytical impact.

### Customer Analysis

The 2 customers with missing cities can affect:

* City-level customer analysis
* Geographic segmentation
* Customer distribution by city

They do not prevent customer-level revenue analysis because the customer IDs and names are available.

### Product Analysis

The product with negative stock can affect:

* Inventory quantity analysis
* Inventory value calculations
* Low-stock analysis

It does not necessarily affect sales revenue calculations.

### Time Analysis

The 6 orders without dates affect time-based analysis.

In particular, 4 of them are marked as `Completed`.

These completed orders cannot be assigned to a specific month, so monthly revenue analysis may not represent every completed order in the dataset.

### Revenue Analysis

Invalid quantities and unit prices can affect revenue calculations.

The affected order-detail records should therefore be reviewed when producing final business KPIs.

---

## 8. Data Quality Validation Rules

The following rules were applied:

| Field                    | Validation Rule                  |
| ------------------------ | -------------------------------- |
| `Customers.BirthDate`    | Must not be in the future        |
| `Customers.CustomerName` | Must not be NULL                 |
| `Customers.City`         | Should be populated              |
| `Customers.Gender`       | Must be `M` or `F` when provided |
| `Products.StockQuantity` | Must not be negative             |
| `Products.Price`         | Must be greater than zero        |
| `Products.Category`      | Should be populated              |
| `Orders.CustomerId`      | Should reference a customer      |
| `Orders.OrderDate`       | Should be populated              |
| `Orders.OrderStatus`     | Must be a valid business status  |
| `OrderDetails.ProductId` | Should reference a product       |
| `OrderDetails.Quantity`  | Must be greater than zero        |
| `OrderDetails.UnitPrice` | Must be greater than zero        |

---

## 9. Recommended Data Cleaning Actions

For a production reporting environment, the following actions would be recommended:

1. Investigate customers with missing city information.
2. Review the product with negative stock.
3. Investigate completed orders without order dates.
4. Review order details with zero or negative quantities.
5. Review order details with zero or negative unit prices.
6. Define database constraints or validation rules to prevent invalid future records.
7. Monitor data quality regularly before generating business reports.

---

## 10. Conclusion

The data quality assessment identified a limited number of issues across the dataset.

Most validation checks returned no issues, while the identified problems were concentrated in missing customer cities, negative inventory, missing order dates, and invalid order-detail values.

The findings highlight the importance of validating transactional data before using it to calculate business KPIs or make business decisions.

Data quality checks are therefore treated as a separate analytical step in this project before interpreting the final sales results.

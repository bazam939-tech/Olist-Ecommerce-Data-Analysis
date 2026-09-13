# 🛒 Olist E-Commerce Data Analysis — SQL & Power BI

## 📌 Project Overview

This project analyzes the **Brazilian E-Commerce Public Dataset by Olist** using **SQL Server** and **Power BI**.

The goal is to transform raw e-commerce data into meaningful business insights related to:

- Sales performance
- Customer behavior
- Seller performance
- Delivery operations
- Payment methods
- Customer satisfaction
- Revenue and order trends

The project follows a complete data analysis workflow:

**Data Quality → SQL Analysis → Data Modeling → DAX Measures → Power BI Dashboard → Business Insights**

---

## 🎯 Business Objectives

The main objectives of this project are to answer important business questions such as:

- How much revenue does the business generate?
- How many orders and customers does it have?
- How is revenue changing over time?
- Which product categories generate the most revenue?
- Which products are the top revenue contributors?
- Which states generate the most orders?
- Which customers and sellers generate the highest revenue?
- How long does it take to deliver orders?
- What percentage of orders are delivered late?
- Which payment methods are most commonly used?
- What is the average customer review score?
- Which categories receive the lowest ratings?

---

# 🗂️ Dataset

The project uses the **Brazilian E-Commerce Public Dataset by Olist**.

The dataset contains information about customers, orders, products, sellers, payments, reviews, and geolocation.

### Main Tables

| Table | Rows |
|---|---:|
| Customers | 99,441 |
| Sellers | 3,095 |
| Products | 32,951 |
| Orders | 99,441 |
| Order Items | 112,650 |
| Order Reviews | 99,224 |
| Order Payments | 103,886 |
| Geolocation | 1,000,163 |
| Product Category Translation | 72 |

---

# 🛠️ Tools & Technologies

### SQL Server

Used for:

- Data quality checks
- Data exploration
- Aggregations
- Joins
- Window functions
- Ranking
- Customer analysis
- Seller analysis
- Payment analysis
- Delivery analysis
- Business analysis

### Power BI

Used for:

- Data modeling
- Relationships
- DAX measures
- KPI cards
- Interactive charts
- Slicers
- Conditional formatting
- Business dashboards

### DAX

Used to calculate:

- Total Revenue
- Total Orders
- Total Customers
- Average Order Value
- Revenue Growth
- Delivery Performance
- Late Delivery Rate
- Average Delivery Days
- Payment Metrics
- Review Metrics

---

# 🧹 Data Quality Analysis

Before performing the business analysis, several data quality checks were performed.

The analysis included:

- Missing values
- Duplicate records
- Negative prices
- Negative freight values
- Invalid payment values
- Invalid review scores
- Order status validation
- Date sequence validation
- Delivery date validation
- Duplicate customer identifiers
- Duplicate product attributes
- Duplicate seller records

This step helped ensure that the analysis was based on reliable data.

---

# 🗄️ SQL Analysis

SQL Server was used to perform exploratory and business analysis on the Olist dataset.

### Main SQL Analysis Areas

#### Sales Analysis

- Total Revenue
- Total Orders
- Average Order Value
- Monthly Revenue
- Monthly Orders
- Month-over-Month Revenue Growth
- Revenue by Customer State
- Revenue by Product
- Revenue by Category

#### Customer Analysis

- Total Customers
- Customer Orders
- Customer Revenue
- Top Customers
- Customer ranking
- Customer distribution by state

#### Seller Analysis

- Total Sellers
- Seller Revenue
- Seller Orders
- Top Sellers
- Seller ranking

#### Payment Analysis

- Payment methods
- Payment transaction volume
- Payment value
- Installment analysis
- Payment method share

#### Delivery Analysis

- Delivery days
- Early deliveries
- On-time deliveries
- Late deliveries
- Late delivery rate
- Delivery performance by state

#### Review Analysis

- Average Review Score
- Review distribution
- Low-rated reviews
- Review analysis by product category

---

# 📊 Power BI Data Model

The Power BI model uses a relational structure connecting the main business entities.

### Main Relationships

```text
Customers
    │
    │ 1 → *
    ▼
Orders
    │
    ├──────────────► Order Items
    │
    ├──────────────► Order Payments
    │
    └──────────────► Order Reviews

Products ─────────► Order Items

Sellers ──────────► Order Items

DateTable ────────► Orders
```

The model uses **single-direction relationships** to reduce ambiguity and avoid unnecessary filter propagation.

---

# 📅 Date Table

A dedicated Date Table was created in Power BI to support time-based analysis.

The Date Table contains:

- Date
- Year
- Month Number
- Month Name
- Year Month

This table is used for:

- Monthly revenue trends
- Revenue growth
- Time-based filtering
- Year analysis
- Monthly analysis

---

# 📐 Key DAX Measures

## Total Revenue

```DAX
Total Revenue =
SUM(order_items[price])
```

## Total Orders

```DAX
Total Orders =
DISTINCTCOUNT(orders[order_id])
```

## Total Customers

```DAX
Total Customers =
DISTINCTCOUNT(customers[customer_unique_id])
```

## Average Order Value

```DAX
Average Order Value =
DIVIDE(
    [Total Revenue],
    [Total Orders]
)
```

## Revenue Growth %

```DAX
Revenue Growth % =
DIVIDE(
    [Total Revenue] - [Previous Month Revenue],
    [Previous Month Revenue]
)
```

## Average Delivery Days

```DAX
Average Delivery Days =
AVERAGEX(
    FILTER(
        orders,
        orders[order_status] = "delivered"
            && NOT ISBLANK(
                orders[order_delivered_customer_date]
            )
    ),
    DATEDIFF(
        orders[order_purchase_timestamp],
        orders[order_delivered_customer_date],
        DAY
    )
)
```

## Late Delivery Rate

```DAX
Late Delivery Rate =
VAR DeliveredOrders =
    FILTER(
        orders,
        orders[order_status] = "delivered"
            && NOT ISBLANK(
                orders[order_delivered_customer_date]
            )
    )

VAR LateOrders =
    FILTER(
        DeliveredOrders,
        orders[order_delivered_customer_date]
            > orders[order_estimated_delivery_date]
    )

RETURN
DIVIDE(
    COUNTROWS(LateOrders),
    COUNTROWS(DeliveredOrders)
)
```

## Average Review Score

```DAX
Average Review Score =
AVERAGE(order_reviews[review_score])
```

---

# 📊 Power BI Dashboard

The Power BI report is organized into **five analytical pages**.

---

## 1️⃣ Sales Analysis

The Sales Analysis page provides an overview of the company's sales performance.

### KPIs

- Total Revenue
- Total Orders
- Average Order Value
- Total Freight
- Revenue Growth %

### Main Visuals

- Monthly Revenue Trend
- Revenue by Category
- Top 10 Products by Revenue
- Revenue by State
- Revenue by Order Status
- Orders by Status

### Filters

- Year
- Month
- Category
- State
- Order Status

---

## 2️⃣ Customer & Seller Analysis

This page focuses on customer and seller performance.

### KPIs

- Total Customers
- Average Customer Revenue
- Total Sellers
- Average Seller Revenue

### Main Visuals

- Top 10 Customers by Revenue
- Customer Orders Distribution
- Top 10 Sellers by Revenue
- Top Sellers by Orders
- Customers by State
- Customer Revenue vs Orders

### Filters

- Year
- Customer State
- Product Category
- Order Status

---

## 3️⃣ Delivery & Operations Analysis

This page analyzes the operational performance of order delivery.

### KPIs

- Average Delivery Days
- Late Delivery Rate
- Delivered Orders
- Late Orders

### Main Visuals

- Delivery Performance
- Average Delivery Days by State
- Late Delivery Rate by State
- Monthly Delivery Performance
- Orders by Delivery Performance
- Delivery Days by Order Status

### Filters

- Year
- Customer State
- Delivery Performance
- Order Status

---

## 4️⃣ Payment & Customer Satisfaction Analysis

This page analyzes payment behavior and customer satisfaction.

### KPIs

- Total Payment Value
- Average Payment Value
- Average Review Score
- Total Reviews
- Low Rated Reviews

### Main Visuals

- Payment Methods
- Payment Method Usage
- Payment Value by Installments
- Review Score Distribution
- Review Score by Category
- Low Rated Reviews by Category
- Payment Value by Year/Month

### Filters

- Year
- Payment Type
- Review Score
- Product Category

---

## 5️⃣ Executive Summary

The Executive Summary provides a high-level view of overall business performance.

### KPIs

- Total Revenue
- Total Orders
- Total Customers
- Average Order Value
- Revenue Growth %

### Main Visuals

- Monthly Revenue Trend
- Revenue by Category
- Orders by State
- Order Status Distribution
- Top 10 Products by Revenue
- Revenue & Growth Trend

### Filters

- Year
- Customer State
- Product Category
- Order Status

---

# 💡 Key Business Insights

The analysis is designed to help answer the following business questions:

### Sales

- Which categories generate the highest revenue?
- Which products are the strongest revenue contributors?
- How does revenue change month by month?
- Which states generate the highest order volume?

### Customers

- Which customers generate the most revenue?
- How frequently do customers place orders?
- Which states have the largest customer base?

### Sellers

- Which sellers generate the highest revenue?
- Which sellers receive the highest number of orders?

### Operations

- What is the average delivery time?
- What percentage of delivered orders are late?
- Which states experience longer delivery times?

### Payments

- Which payment method generates the highest payment value?
- Which payment methods are most frequently used?
- How are payments distributed across installment counts?

### Customer Satisfaction

- What is the average review score?
- How are reviews distributed across rating levels?
- Which categories have more low-rated reviews?

---

# 📁 Project Structure

```text
Olist-Ecommerce-Data-Analysis/
│
├── README.md
│
├── SQL/
│   └── Olist_Data_Analysis.sql
│
├── PowerBI/
│   └── Olist_Ecommerce_Analysis.pbix
│
└── Screenshots/
    ├── Sales-Analysis.png
    ├── Customer-Seller-Analysis.png
    ├── Delivery-Operations.png
    ├── Payment-Customer-Satisfaction.png
    └── Executive-Summary.png
```

---

# 🚀 Project Workflow

```text
Raw E-Commerce Data
        ↓
Data Quality Checks
        ↓
SQL Server
        ↓
Data Exploration & Analysis
        ↓
Power BI Data Model
        ↓
DAX Measures
        ↓
Interactive Dashboard
        ↓
Business Insights
```

---

# 🎓 Skills Demonstrated

Through this project, I demonstrated practical skills in:

- SQL
- Data Cleaning
- Data Quality Analysis
- Data Exploration
- Data Modeling
- DAX
- Power BI
- KPI Development
- Data Visualization
- Business Analysis
- Customer Analysis
- Sales Analysis
- Operational Analysis
- Payment Analysis
- Customer Satisfaction Analysis

---

# 👨‍💻 Author

**Mohamed Baza**

Junior Data Analyst | SQL & Power BI

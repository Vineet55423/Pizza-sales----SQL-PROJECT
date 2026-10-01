# 🍕 Pizza Sales Data Analysis --- SQL Project

A SQL-based data analysis project focused on exploring and analyzing a
pizza sales dataset using **Microsoft SQL Server**.

The project was completed as a practical exercise to strengthen SQL
skills by solving business-oriented questions related to orders,
revenue, pizza categories, sizes, ordering patterns, and product
performance.

> 📌 **Project Source:** Inspired by a SQL project from [WsCube
> Tech](https://www.youtube.com/@WsCubeTech)

------------------------------------------------------------------------

## 📊 Project Overview

This project analyzes pizza sales data stored across four related
tables:

-   `orders`
-   `order_details`
-   `pizzas`
-   `pizza_types`

The database structure connects orders with individual pizza items,
their prices/sizes, and pizza type information.

### Database Relationship

``` text
orders
  │
  │ order_id
  ▼
order_details
  │
  │ pizza_id
  ▼
pizzas
  │
  │ pizza_type_id
  ▼
pizza_types
```

------------------------------------------------------------------------

## 🎯 Project Objectives

The main objective was to use SQL to answer practical business questions
such as:

-   How many orders were placed?
-   How much revenue was generated?
-   Which pizza has the highest price?
-   Which pizza size is ordered most frequently?
-   Which pizza types generate the most revenue?
-   How are orders distributed throughout the day?
-   What percentage of total revenue does each pizza type contribute?
-   How does cumulative revenue change over time?
-   Which are the top 3 revenue-generating pizzas within each category?

------------------------------------------------------------------------

## 🗂️ Dataset Schema

### 1. `orders`

  Column       Description
  ------------ ------------------------------------
  `order_id`   Unique identifier for an order
  `date`       Date on which the order was placed
  `time`       Time at which the order was placed

### 2. `order_details`

  Column               Description
  -------------------- ---------------------------------------
  `order_details_id`   Unique identifier for an order detail
  `order_id`           Reference to the order
  `pizza_id`           Reference to the pizza
  `quantity`           Quantity of pizzas ordered

### 3. `pizzas`

  Column            Description
  ----------------- -------------------------------
  `pizza_id`        Unique identifier for a pizza
  `pizza_type_id`   Reference to the pizza type
  `size`            Size of the pizza
  `price`           Price of the pizza

### 4. `pizza_types`

  Column            Description
  ----------------- ------------------------------------
  `pizza_type_id`   Unique identifier for a pizza type
  `name`            Name of the pizza
  `category`        Pizza category
  `ingredients`     Ingredients used in the pizza

------------------------------------------------------------------------

## 🔍 Analysis Performed

### 🟢 Basic Analysis

1.  **Total number of orders placed**
2.  **Total revenue generated from pizza sales**
3.  **Highest-priced pizza**
4.  **Most common pizza size ordered**
5.  **Top 5 most ordered pizza types by quantity**

### 🟡 Intermediate Analysis

6.  **Total quantity of pizzas ordered by category**
7.  **Distribution of orders by hour of the day**
8.  **Category-wise sales/revenue distribution**
9.  **Average number of pizzas ordered per day**
10. **Top 3 pizza types based on revenue**

### 🔴 Advanced Analysis

11. **Percentage contribution of each pizza type to total revenue**
12. **Cumulative revenue generated over time**
13. **Top 3 revenue-generating pizza types within each pizza category**

------------------------------------------------------------------------

## 🛠️ SQL Concepts Used

This project provided hands-on practice with:

-   `SELECT`
-   `WHERE`
-   `ORDER BY`
-   `GROUP BY`
-   Aggregate Functions
    -   `COUNT()`
    -   `SUM()`
    -   `AVG()`
    -   `MAX()`
-   `INNER JOIN`
-   Subqueries
-   Common Table Expressions (`CTE`)
-   Window Functions
-   `ROW_NUMBER()`
-   `SUM() OVER()`
-   `DATEPART()`
-   `CASE`-style analytical thinking
-   Ranking
-   Percentage calculations
-   Date and time-based analysis
-   Revenue analysis
-   Top-N analysis

------------------------------------------------------------------------

## 💡 Key Learning Outcomes

Through this project, I strengthened my ability to:

-   Work with relational databases and connected tables.
-   Join data from multiple tables to answer analytical questions.
-   Use aggregate functions for business summaries.
-   Apply CTEs to structure complex queries.
-   Use window functions for ranking and cumulative calculations.
-   Perform date and time-based analysis.
-   Calculate revenue contribution and cumulative revenue.
-   Translate business questions into SQL queries.
-   Approach SQL from a data-analysis perspective rather than only
    focusing on syntax.

------------------------------------------------------------------------

## 📁 Repository Structure

``` text
pizza-sales-sql-analysis/
│
├── solution_pizza.sql
├── database-diagram.png
└── README.md
```

### Files

  File                     Description
  ------------------------ -----------------------------------------
  `solution_pizza.sql`     SQL database setup and analysis queries
  `database-diagram.png`   Database relationship/schema diagram
  `README.md`              Project documentation

------------------------------------------------------------------------

## ⚙️ How to Run the Project

### Prerequisites

-   Microsoft SQL Server
-   SQL Server Management Studio (SSMS)

### Steps

1.  Clone this repository:

``` bash
git clone https://github.com/Vineet55423/Pizza-sales----SQL-PROJECT.git
```

2.  Open `solution_pizza.sql` in SQL Server Management Studio.

3.  Execute the database creation section:

``` sql
CREATE DATABASE PIZZA_PROJECT;

USE PIZZA_PROJECT;
```

4.  Make sure the required dataset tables are available:

``` text
orders
order_details
pizzas
pizza_types
```

5.  Run the analysis queries section by section.

------------------------------------------------------------------------

## 📈 Example Business Questions

Some of the questions answered in this project include:

``` text
• What is the total revenue generated?
• Which pizza size is ordered most frequently?
• Which pizza category generates the highest sales?
• How many orders are placed during each hour?
• Which pizza types generate the most revenue?
• What percentage of total revenue comes from each pizza type?
• What is the cumulative revenue over time?
• What are the top 3 pizzas by revenue within each category?
```

These questions demonstrate how SQL can be used to transform
transactional data into information that can support business analysis.

------------------------------------------------------------------------

## 🧠 Project Takeaway

The biggest takeaway from this project was learning to think beyond:

> "Which SQL query should I write?"

and instead ask:

> **"What business question am I trying to answer, and what does the
> data tell me?"**

This project helped me move from practicing individual SQL concepts
toward applying them together in a structured data-analysis workflow.

------------------------------------------------------------------------

## 👨‍💻 About

This project is part of my ongoing **AI & Data Science learning
journey**.

My current learning path includes:

``` text
SQL
 ↓
Python
 ↓
NumPy
 ↓
Pandas
 ↓
Exploratory Data Analysis
 ↓
Data Visualization
 ↓
Statistics & Probability
 ↓
Machine Learning
 ↓
Artificial Intelligence
```

------------------------------------------------------------------------

## 🔗 Connect

-   **GitHub:** https://www.github.com/Vineet55423
-   **LinkedIn:** https://www.linkedin.com/in/vineet-yadav-377290318/

------------------------------------------------------------------------

## 🙏 Acknowledgement

This project was completed as a practical learning exercise based on the
**Pizza Sales SQL project by WsCube Tech**.

The purpose of this repository is to document my learning, SQL practice,
and analytical problem-solving process.

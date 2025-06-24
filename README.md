# SQLDatabase

SQL Portfolio Project — Superstore Order Analysis

This project explores and analyzes a retail order dataset using SQL. The database, `df_orders`, contains transactional sales data including prices, profits, categories, segments, and regions.

---

## Project Objectives

- Analyze revenue and profit across regions
- Discover the most profitable product segments and cities
- Understand customer behavior by segment
- Identify monthly revenue trends
- Use SQL to cleanly and clearly extract business insights

---

## Dataset Overview

| Column         | Description                            |
|----------------|----------------------------------------|
| Order Id       | Unique order identifier                |
| Order Date     | Date of purchase                       |
| Ship Mode      | Shipping method                        |
| Segment        | Customer segment (e.g., Consumer)      |
| Region         | Geographical region                    |
| Category       | Product category                       |
| Sub Category   | Product sub-type                       |
| Product Id     | SKU/Product code                       |
| Sale Price     | Final price paid after discount        |
| Discount       | Discount percentage                    |
| Profit         | Revenue profit from the sale           |

---

## Insights

### 1. Sales & Profit by Region
select 
 region,
 round(sum(sale_price), 2) as total_sales,
 round(sum(profit), 2) as total_profit 
from df_orders
group by region
order by total_sales desc;

### 2. Top 5 Most Profitable Cities
select 
 city,
 state,
 round(sum(profit)) as total_profit
from df_orders
group by city, state
order by total_profit 
limit 5;

### 3. Average Discount by Category
select 
 category, 
 round(avg(discount), 2) as avg_discount 
from df_orders 
group by category;

### 4. Monthly Sales Trend
select 
 date_format(order_date, '%Y-%m') as month,
 round(sum(sale_price), 2) as monthly_sales
from df_orders
group by month
order by month;

### 5. Customer Segment Performance
select 
 segment,
 count(order_id) as total_orders,
 round(sum(sale_price), 2) as total_sales,
 round(sum(profit), 2) as total_profit
from df_orders 
group by segment;


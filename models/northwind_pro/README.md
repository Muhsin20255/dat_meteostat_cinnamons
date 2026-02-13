# Northwind Sales Insights with dbt

## Business Problem
Northwind stores raw operational data, but it is not ready for analytics. 
Column names are inconsistent and revenue calculations are not standardized.

## Models Built

### Staging Layer
- staging_orders
- staging_order_details
- staging_products
- staging_categories

These models clean and standardize raw data.

### Prep Layer
- prep_sales

This model joins all staging tables and calculates revenue, order_year, and order_month.

### Mart Layer
- mart_sales_performance

This model aggregates sales by year, month, and category. 
It provides total revenue, number of orders, and average revenue per order.

## Insights
The mart allows analysis of:
- Monthly sales trends
- Category performance
- Revenue growth over time

## Biggest Learning
Understanding how to structure a dbt project into staging, prep, and mart layers.

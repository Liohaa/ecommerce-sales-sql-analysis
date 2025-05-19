# E-commerce Sales Analysis

Data analysis project using SQL: exploring e-commerce sales, customer behavior, product trends, and order performance.

## Goals

To help the business understand:  
- how much it sells,  
- who the customers are,  
- how well orders are delivered,  
- and which products, brands generate the most revenue and profit.

This can help the company improve sales, marketing, and products.

## Project Structure

- `01_general_metrics/`: Total orders (success/unsusses counts), total revenue and profit, average order value  
- `02_user_analysis/`: Customer geography, new users by month  
- `03_order_analysis/`: Return rate by country, users groups, category
- `04_product_analysis/`: Top categories, top brands, top products and margin  
- `data/`: Raw CSV files used in this project

## Tools

- SQL (PostgreSQL syntax)  
- DB Browser for SQLite or DBeaver (optional)

## Datasets

All data is stored in the `data/` folder.  
These are the next tables:

`users.csv`: Info about customers (`country`, `state`, `city`, `gender`, etc.) — basic demographic and location data of customers  
`products.csv`: Info about products (`category`, `brand`, `retail_price`, `cost`, etc.) — key product details including pricing and classification  
`orders.csv`: General info about orders (`status`, `created_at`, `returned_at`, `delivered_at`, `num_of_item`, etc.) — order status, timing, and number of items per order  
`order_items.csv`: Each item in an order (`user_id`, `product_id`, `order_id`, `status`, etc.) — detailed order item linkage and status for each product

**Source:** Data was taken from [Looker Ecommerce BigQuery Dataset on Kaggle](https://www.kaggle.com/datasets/mustafakeser4/looker-ecommerce-bigquery-dataset)

## How to Use

1. Load CSV files into your SQL database  
2. Open each `.sql` file to run analysis  
3. Read the `README.md` in each folder to understand the goal of each query

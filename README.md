# E-commerce Sales Analysis

Data analysis project using SQL and Power BI: exploring e-commerce sales, customer behavior, product trends, and order performance.

## Goals

This project helps to better understand key aspects of e-commerce performance, such as:

- sales results – total number of orders, revenue, and profit
- customer profile – who the buyers are and where they are from
- order process – how often orders are returned or canceled
- product and brand results – which items bring the most money

These insights can support better decisions in marketing, product planning, and overall business strategy.

## Project Structure

- `01_general_metrics/`: Total orders (success/unsusses counts), total revenue and profit, average order value  
- `02_user_analysis/`: Customer geography, new users by month  
- `03_order_analysis/`: Return rate by country, users groups, category
- `04_product_analysis/`: Top categories, top brands, top products and margin  
- `data/`: Raw CSV files used in this project
- `power_bi/`: Interactive dashboard file in `.pbix` format. You can download and explore the full Power BI dashboard used in this project.
- `screenshots/`: Exported visualizations used in the report summary. Each screenshot corresponds to a key analysis block and is referenced in the summary report.
- `summary.md`: Final report with key findings. Links to screenshots are included for clarity.

## Dashboard and Visualizations

The interactive Power BI dashboard (`Dashboard.pbix`) is located in the `powerbi/` folder.  
Key screenshots of each report page  is located in the `screenshots/` folder.

You can explore visual insights from:
- General sales metrics
- User behavior and new customer trends
- Order performance and return patterns
- Product and brand profitability

📄 For main insights, see `Summary.md`

## Tools

- SQL (PostgreSQL syntax)  
- DB Browser for SQLite or DBeaver (optional)
- Power BI Desktop

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

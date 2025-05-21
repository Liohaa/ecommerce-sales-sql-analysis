# Block 2: User Analysis

This folder has SQL queries to analyze orders and revenue metrics by country, quarter, and new user activity.

## Important Notes on Data

- Revenue is calculated by summing retail prices of products in the order_items.
- There is **no** `quantity` column in the data, each row in `order_items` is one product item in an order.

## Queries in this folder:

### 1.Customer Geography - Orders and Revenue by Country and Quarter  
- Groups orders and revenue by quarter and user country.  
- Counts distinct completed orders and sums revenue from products in those orders.  
- Filters orders based on recent data (from 2022-01-01).

### 2. New Users Activity and Revenue by Month  
- Count how many new users joined each month.  
- Count how many new users made orders in the same month.  
- Count how many new users made finished (complete) orders in the same month.   
- Calculates revenue from new users in their first month.  
- Calculates total revenue from these new users from new users for all time.  
- Calculates what percent of new users made orders in their first month.

---

## Notes

- The first query helps see how many orders and money come from different countries and quarters.  
- The second query helps see how new users make orders and money.  
We consider only completed orders to accurately count revenue and order numbers.  
- Queries group results by "month" and "quarter".

---

If you want to use or change queries, feel free to ask.

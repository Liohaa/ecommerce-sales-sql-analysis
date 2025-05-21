# Block 1: General Metrics

This folder contains SQL queries to analyze basic order data and sales metrics.

## Important Notes on Data

- The `orders.num_of_item` shows the total number of items in an order (can be different products).
- There is **no** `quantity` column in the data.
- To count product units, use the number of rows in `order_items`, not `orders.num_of_item`.
- Each row in `order_items` is one product item in an order.

## Queries in this folder:

### 1. Total Orders and Status Breakdown  
- Counts total orders and unique customers.  
- Counts orders by status: successful (Complete), unsuccessful (Returned + Cancelled), cancelled, and returned.  
- Shows percent for each status from total orders.

### 2. Total Revenue and Profit  
- Calculates total revenue and total profit by quarter from successfully completed items only.  
- Revenue is the sum of retail prices; profit is retail price minus cost.

### 3. Average Order Value (AOV)  
This query finds the average money made from one order.  
- Calculates average order money for a time period for completed orders.  
- Sums retail prices of products in completed orders and divides by number of orders.

There are two types of this query:

- **3a. AOV by Month:**  
  Groups results by month (format YYYY-MM). Shows average order money by month.

- **3b. AOV by Quarter and Category:**  
  Groups results by quarter and product category. Shows average order money by quarter and category.

---

## Notes

- The first query shows order status to see success and unsuccess rates.  
- The second query shows revenue and profit from sold items, not just orders.  
- The third query helps see how average order revenue changes by time or category.  

---

If you want to use or change queries, feel free to ask.

-- Calculate total revenue and profit by quarter from successfully completed items
-- The `orders.num_of_item` shows total number of items in the order (possibly different products)
-- There is no `quantity` column exists, so we count by order_items rows, not by orders.num_of_item
-- Each row in order_items is one product item in an order
-- Revenue and profit are summed from order_items rows with status 'Complete'
SELECT 
	TO_CHAR(DATE_TRUNC('quarter', ord.created_at),'YYYY "Q"Q') AS quarter,
    SUM(p.retail_price) AS total_revenue,
    SUM(p.retail_price - p.cost) AS total_profit
FROM order_items ord
JOIN products p ON ord.product_id=p.id
WHERE ord.status='Complete'
GROUP BY quarter;

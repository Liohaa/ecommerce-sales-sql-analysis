-- Calculate average order value (AOV) by month
-- See above for explanation of order_items and quantity
-- Sum prices from order_items and divide by number of orders
-- orders.created_at = the moment the full order was made
SELECT 
    TO_CHAR(DATE_TRUNC('month', o.created_at), 'YYYY-MM') AS "month",
    SUM(p.retail_price) AS revenue,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(p.retail_price)/COUNT(DISTINCT o.order_id),2) AS avg_order_value
FROM order_items ord
JOIN orders o ON o.order_id=ord.order_id
JOIN products p ON ord.product_id=p.id
WHERE o.status='Complete'
GROUP BY "month"
ORDER BY "month" desc; 

-- Calculate total orders and revenue by country and quarter
-- Use only completed orders
-- Date range is from 2022-01 (inclusive)
SELECT 
	TO_CHAR(DATE_TRUNC('quarter', o.created_at), 'YYYY "Q"Q') AS quarter,
    u.country AS country,
    COUNT(DISTINCT o.order_id) AS orders,
    SUM(p.retail_price) AS revenue
FROM users u
JOIN order_items ord ON ord.user_id=u.id
JOIN orders o ON o.order_id=ord.order_id
JOIN products p ON ord.product_id=p.id
WHERE o.status='Complete'
	AND o.created_at >= DATE '2022-01-01'
GROUP BY quarter, u.country
ORDER BY quarter DESC, revenue DESC;

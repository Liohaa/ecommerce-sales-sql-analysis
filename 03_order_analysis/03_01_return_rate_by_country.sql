-- Calculate return rate by country and quarter
-- Metrics: returned orders, all (completed + returned) orders, return percentage
-- Date range is from 2022-01 (inclusive)
SELECT
	TO_CHAR(DATE_TRUNC('quarter', o.created_at), 'YYYY "Q"Q') AS quarter,
    u.country,
	COUNT(CASE WHEN o.status = 'Returned' THEN 1 END) AS returned_orders,
	COUNT(CASE WHEN o.status IN ('Complete', 'Returned') THEN 1 END) AS total_orders,
    ROUND(COUNT(CASE WHEN o.status = 'Returned' THEN 1 END) *100.0/
		COALESCE(NULLIF(COUNT(CASE WHEN o.status IN ('Complete', 'Returned') THEN 1 END),0),1),2) 
			AS percent_returns
FROM users u
JOIN orders o ON o.user_id=u.id
JOIN order_items ord ON o.order_id=ord.order_id
JOIN products p ON p.id=ord.product_id
WHERE o.created_at>= DATE '2022-01-01'
GROUP BY quarter, u.country
ORDER BY quarter, total_orders DESC;

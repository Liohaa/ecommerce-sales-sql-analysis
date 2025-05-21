-- Calculate new users per month and their activity
-- Metrics: new users, those who made orders,those who made successful orders,
-- revenue from new users (same month), total revenue from them (all time), % who ordered (same month)
SELECT 
	TO_CHAR(DATE_TRUNC('month', u.created_at), 'YYYY-MM') AS month,
	COUNT(DISTINCT u.id) AS new_users,
	COUNT(DISTINCT CASE 
		WHEN DATE_TRUNC('month', u.created_at) = DATE_TRUNC('month', o.created_at)
		THEN u.id END) AS new_users_with_orders,
	COUNT(DISTINCT CASE 
		WHEN DATE_TRUNC('month', u.created_at) = DATE_TRUNC('month', o.created_at)
		AND o.status = 'Complete' 
		THEN u.id END) AS new_users_with_success_orders,
	SUM(CASE 
		WHEN DATE_TRUNC('month', u.created_at) = DATE_TRUNC('month', o.created_at)
		AND o.status = 'Complete' 
		THEN p.retail_price END) AS revenue_from_new_users,
	ROUND(100.0* COUNT(DISTINCT CASE 
		WHEN DATE_TRUNC('month', u.created_at) = DATE_TRUNC('month', o.created_at)
		THEN u.id END) / 
			NULLIF(COUNT(DISTINCT u.id),0),1) AS percent_new_users_with_orders,
	SUM(CASE 
	WHEN o.status = 'Complete' 
	AND DATE_TRUNC('month', u.created_at) <= DATE_TRUNC('month', o.created_at) 
    THEN p.retail_price END) AS total_revenue_to_date
FROM users u
JOIN orders o ON o.user_id=u.id
JOIN order_items ord ON o.order_id=ord.order_id
JOIN products p ON p.id=ord.product_id
GROUP BY month
ORDER BY month, revenue_from_new_users DESC;

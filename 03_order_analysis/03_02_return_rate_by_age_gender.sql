-- Calculate return rates by user age group and gender
-- Metrics: count of returned orders, total completed+returned orders, % of returns
SELECT 
    TO_CHAR(DATE_TRUNC('quarter', o.created_at), 'YYYY "Q"Q') AS quarter,
    CASE WHEN u.age BETWEEN 18 AND 30 THEN '18-30'
		 WHEN u.age BETWEEN 31 AND 49 THEN '31-49'
		 ELSE '50+' END AS age_group,
    u.gender,
    COUNT(CASE WHEN o.status = 'Returned' THEN 1 END) AS returned_orders,
    COUNT(CASE WHEN o.status IN ('Complete', 'Returned') THEN 1 END) AS total_orders,
    ROUND(100.0 * COUNT(CASE WHEN o.status = 'Returned' THEN 1 END)/ 
		NULLIF(COUNT(CASE WHEN o.status IN ('Complete', 'Returned') THEN 1 END),0),2) AS percent_returns
FROM users u
JOIN orders o ON o.user_id=u.id
JOIN order_items ord ON o.order_id=ord.order_id
JOIN products p ON p.id = ord.product_id
WHERE o.created_at >= DATE '2022-01-01'
GROUP BY quarter, age_group, u.gender
ORDER BY quarter, age_group, u.gender;

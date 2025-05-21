-- Calculate return rates by product category
-- Metrics: count of returned orders, total completed+returned orders, % of returns
SELECT 
    TO_CHAR(DATE_TRUNC('quarter', o.created_at), 'YYYY "Q"Q') AS quarter,
    p.category,
    COUNT(CASE WHEN o.status = 'Returned' THEN 1 END) AS returned_orders,
    COUNT(CASE WHEN o.status IN ('Complete', 'Returned') THEN 1 END) AS total_orders,
    ROUND(100.0 * COUNT(CASE WHEN o.status = 'Returned' THEN 1 END)/ 
        NULLIF(COUNT(CASE WHEN o.status IN ('Complete', 'Returned') THEN 1 END),0),2) AS percent_returns
FROM orders o
JOIN order_items ord ON o.order_id=ord.order_id
JOIN products p ON p.id=ord.product_id
JOIN users u ON o.user_id=u.id
WHERE o.created_at>= DATE '2022-01-01'
GROUP BY quarter, p.category
ORDER BY quarter, total_orders DESC;

-- Top 5 product categories by revenue for each year and country
-- Metrics: number of orders, revenue, profit by category
-- Date range is from 2022-01 (inclusive)
WITH category_data AS (
	SELECT 
		TO_CHAR(DATE_TRUNC('year', o.created_at), 'YYYY "Q"Q') as year,
		u.country AS country,
		p.category AS category,
		COUNT(DISTINCT o.order_id) AS orders,
		SUM(p.retail_price) AS revenue,
		SUM(p.retail_price-p.cost) AS profit
	FROM users u
	JOIN order_items ord ON ord.user_id=u.id
	JOIN orders o ON o.order_id=ord.order_id
	JOIN products p ON ord.product_id=p.id
	WHERE o.status = 'Complete'
	AND o.created_at >= DATE '2022-01-01'
	GROUP BY year, u.country, p.category 
			)
SELECT year, country, rank, category, revenue, profit, orders
FROM (SELECT *,
		DENSE_RANK() OVER (PARTITION BY year, country ORDER BY revenue DESC) AS rank 
		FROM category_data) AS sub
WHERE rank<= 5 
ORDER BY year desc, country, rank;

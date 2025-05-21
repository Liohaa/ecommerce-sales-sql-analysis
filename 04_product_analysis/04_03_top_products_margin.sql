-- Top 10 products by profit for each year and country
-- Metrics: revenue, profit, profit margin (%) by product
-- Date range: from 2022-01-01 inclusive
WITH product_profit AS (
    SELECT
        DATE_TRUNC('year', o.created_at) AS year,
        u.country AS country,
        p.name AS product_name,
        COUNT(*) AS total_units_orders,
        SUM(p.retail_price) AS revenue,
        SUM(p.retail_price-p.cost) AS profit
    FROM users u
    JOIN order_items ord ON ord.user_id = u.id
    JOIN orders o ON o.order_id = ord.order_id
    JOIN products p ON ord.product_id = p.id
    WHERE o.status = 'Complete'
	AND o.created_at >= DATE '2022-01-01'
    GROUP BY year, u.country, p.name
			),
ranked_products AS (
    SELECT *, 
		SUM(profit) OVER (PARTITION BY year, country) AS total_profit,
		ROW_NUMBER() OVER (PARTITION BY year, country ORDER BY profit DESC) AS rank
    FROM product_profit
)
SELECT year, country, rank, product_name, revenue, profit,
	ROUND(profit / NULLIF(revenue,0) *100.0, 2)::TEXT || ' %' AS margin_percent
FROM ranked_products
WHERE rank <= 10
ORDER BY year DESC, country, rank, product_name;

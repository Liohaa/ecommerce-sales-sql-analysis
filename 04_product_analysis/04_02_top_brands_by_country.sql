-- Top 3 brands by profit for each year and country
-- Metrics: revenue, profit by brand, profit share (%) by brand
-- Date range is from 2022-01 (inclusive)
WITH brand_data AS (
    SELECT
		TO_CHAR(DATE_TRUNC('year', o.created_at), 'YYYY "Q"Q') as year,
        u.country AS country,
        p.brand AS brand,
        COUNT(DISTINCT o.order_id) AS orders,
        SUM(p.retail_price) AS revenue,
        SUM(p.retail_price-p.cost) AS profit
    FROM users u
    JOIN order_items ord ON ord.user_id=u.id
    JOIN orders o ON o.order_id=ord.order_id
    JOIN products p ON ord.product_id=p.id
    WHERE o.status = 'Complete'
	AND o.created_at >= DATE '2022-01-01'
    GROUP BY year, u.country, p.brand
			),
ranked_brands AS (
    SELECT *,
        SUM(profit) OVER (PARTITION BY year, country) AS total_profit,
        ROW_NUMBER() OVER (PARTITION BY year, country ORDER BY profit DESC) AS rank
	FROM brand_data
			)
SELECT
    year,
    country,
    rank,
    brand,
	revenue,
    profit,
    ROUND(profit*100.0/total_profit, 2) AS profit_percent
FROM ranked_brands
WHERE rank <= 3
ORDER BY year DESC, country, rank;

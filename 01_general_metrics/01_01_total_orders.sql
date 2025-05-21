-- Total number of orders and breakdown by status
-- Breakdown of orders by status: successful, unsuccessful (returned + cancelled), cancelled, and returned
-- Counts unique customers
SELECT 
    COUNT(*) AS total_orders,
    COUNT(DISTINCT user_id) AS unique_customers,
 -- Successful orders
    COUNT(CASE WHEN status='Complete' THEN 1 END) AS successful_orders,
    ROUND(COUNT(CASE WHEN status='Complete' THEN 1 END)*100.0/COUNT(*),2)::TEXT || ' %' AS success_percent,
 -- Unsuccessful orders (Returned + Cancelled)
    COUNT(CASE WHEN status IN ('Returned', 'Cancelled') THEN 1 END) AS unsuccessful_orders,
    ROUND(COUNT(CASE WHEN status IN ('Returned', 'Cancelled') THEN 1 END)*100.0/COUNT(*),2)::TEXT || ' %' AS unsuccess_percent,
 -- Cancelled orders
    COUNT(CASE WHEN status='Cancelled' THEN 1 END) AS cancelled_orders,
    ROUND(COUNT(CASE WHEN status = 'Cancelled' THEN 1 END)*100.0/COUNT(*),2)::TEXT || ' %' AS cancelled_percent,
 -- Returned orders
    COUNT(CASE WHEN status='Returned' THEN 1 END) AS returned_orders,
    ROUND(COUNT(CASE WHEN status='Returned' THEN 1 END)*100.0/COUNT(*),2)::TEXT || ' %' AS returned_percent
FROM orders;


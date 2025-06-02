create database blinkit;

---#1-----
SELECT 
    p.category,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
FROM 
    blinkit_order_items oi
JOIN 
    blinkit_products p ON oi.product_id = p.product_id
GROUP BY 
    p.category
ORDER BY 
    total_revenue DESC;
    
    
    ----#2------
    SELECT 
    p.product_name,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
FROM 
    blinkit_order_items oi
JOIN 
    blinkit_products p ON oi.product_id = p.product_id
GROUP BY 
    p.product_name
ORDER BY 
    total_revenue DESC
LIMIT 10;

----#3----
SELECT 
    o.customer_id,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
FROM 
    blinkit_orders o
JOIN 
    blinkit_order_items oi ON o.order_id = oi.order_id
GROUP BY 
    o.customer_id
ORDER BY 
    total_revenue DESC;

----#4-----
SELECT 
    ROUND(AVG(TIMESTAMPDIFF(MINUTE,
        STR_TO_DATE(order_date, '%d-%m-%Y %H:%i'),
        STR_TO_DATE(actual_delivery_time, '%d-%m-%Y %H:%i')
    )), 2) AS avg_delivery_time_minutes
FROM 
    blinkit_orders
WHERE 
    actual_delivery_time IS NOT NULL;
    
    ----#5----
   SELECT 
    p.product_id,
    p.product_name,
    i.available_quantity
FROM 
    blinkit_inventory i
JOIN 
    blinkit_products p ON i.product_id = p.product_id
WHERE 
    i.available_quantity = 0;

---#6----
SELECT 
    channel,
    SUM(spend) AS total_spend,
    SUM(revenue_generated) AS total_revenue,
    ROUND(((SUM(revenue_generated) - SUM(spend)) / SUM(spend)) * 100, 2) AS roi_percentage
FROM 
    blinkit_marketing_performance
GROUP BY 
    channel
ORDER BY 
    roi_percentage DESC;
    
    ----#7----
   SELECT 
    product_id,
    product_name,
    rating,
    number_of_reviews
FROM 
    blinkit_products
WHERE 
    rating IS NOT NULL
  AND number_of_reviews >= 10
ORDER BY 
    rating DESC
LIMIT 10;

----#8-----
WITH first_order AS (
    SELECT 
        customer_id,
        MIN(STR_TO_DATE(order_date, '%d-%m-%Y')) AS first_order_date
    FROM 
        blinkit_orders
    GROUP BY 
        customer_id
),
labeled_orders AS (
    SELECT 
        o.order_id,
        o.customer_id,
        STR_TO_DATE(o.order_date, '%d-%m-%Y') AS order_date,
        CASE 
            WHEN STR_TO_DATE(o.order_date, '%d-%m-%Y') = f.first_order_date THEN 'New'
            ELSE 'Returning'
        END AS customer_type
    FROM 
        blinkit_orders o
    JOIN 
        first_order f ON o.customer_id = f.customer_id
)
SELECT 
    customer_type,
    COUNT(*) AS total_orders
FROM 
    labeled_orders
GROUP BY 
    customer_type;


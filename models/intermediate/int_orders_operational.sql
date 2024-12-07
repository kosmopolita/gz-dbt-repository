SELECT
    orders_id,
    date_date,
    ROUND(SUM(margin + shipping_fee - log_cost - ship_cost), 2) AS operation_margin,
    SUM(quantity) AS quantity,
    ROUND(SUM(purchase_cost), 2) AS purchase_cost,
    ROUND(SUM(margin), 2) AS margin,
FROM {{ ref('int_orders_margin')}}
JOIN {{ ref('stg_raw__ship')}} USING (orders_id)
GROUP BY orders_id, date_date
ORDER BY orders_id DESC
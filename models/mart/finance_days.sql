{{ config( materialized='view')}}

SELECT
    date_date,
    COUNT(orders_id) AS nb_transactions,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(revenue) / COUNT(orders_id), 2) AS average_basket,
    ROUND(SUM(margin), 2) AS margin,
    ROUND(SUM(operation_margin), 2) AS operation_margin,
    ROUND(SUM(purchase_cost), 2) AS purchase_cost,
    ROUND(SUM(shipping_fee), 2) AS shipping_fee,
    ROUND(SUM(log_cost), 2) AS log_cost,
    SUM(quantity) AS quantity,
FROM {{ ref('int_orders_operational')}}
GROUP BY date_date
ORDER BY date_date DESC

-- finance_campaigns_day.sql

SELECT
    date_date AS date,
    ROUND(operation_margin - ads_cost, 1) AS ads_margin,
    average_basket,
    ROUND(operation_margin, 1) AS operation_margin,
    ads_cost,
    ads_impression,
    ads_click,
    quantity,
    revenue,
    purchase_cost,
    margin,
    shipping_fee,
    log_cost AS logcost,
    ship_cost,
FROM {{ ref('finance_days')}}
JOIN {{ ref('int_campaigns_day')}} USING (date_date)
ORDER BY date DESC
    
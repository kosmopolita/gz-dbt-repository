SELECT
    orders_id,
    date_date,
    ROUND(SUM(revenue), 2) AS revenue,
    SUM(quantity) AS quantity,
    ROUND(SUM(purchase_price*quantity), 2) AS purchase_cost,
    ROUND(SUM(margin), 2) AS margin,
FROM {{ ref('int_sales_margin')}}
GROUP BY date_date, orders_id
ORDER BY orders_id DESC
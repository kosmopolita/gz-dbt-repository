SELECT

    CONCAT(EXTRACT(YEAR FROM date), '-0', EXTRACT(MONTH FROM date), '-01') AS datemonth,
    ROUND(SUM(ads_margin), 2) AS ads_margin,
    ROUND(SUM(operation_margin), 2) AS operation_margin,
    ROUND(SUM(ads_cost), 2) AS ads_cost,
    ROUND(SUM(ads_impression), 2) AS ads_impression,
    ROUND(SUM(ads_click), 2) AS ads_click,
FROM {{ ref('finance_campaigns_day')}}
GROUP BY datemonth
ORDER BY datemonth DESC
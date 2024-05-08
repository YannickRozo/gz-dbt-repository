SELECT 
    date_date
    ,ROUND(operational_margin-ads_cost,2) AS ads_margin
    ,average_basket
    ,operational_margin
    ,ads_cost
FROM {{ ref('finance_days') }}
LEFT JOIN {{ ref('int_campaigns_day') }}
USING (date_date)
ORDER BY date_date DESC
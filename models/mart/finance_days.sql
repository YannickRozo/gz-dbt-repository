WITH t1 AS (SELECT 
    date_date
    ,ROUND(COUNT(orders_id),2) AS nb_transactions
    ,ROUND(SUM(revenue),2) AS revenue
    ,ROUND(SUM(revenue)/COUNT(orders_id),2) AS average_basket
    ,ROUND(SUM(margin),2) AS margin
    -- ,SUM(operational_margin) AS operational_margin
FROM {{ ref('int_orders_margin') }}
GROUP BY date_date
ORDER BY date_date DESC
)
, t2 AS (SELECT 
    date_date
    ,ROUND(SUM(operational_margin),2) AS operational_margin
FROM {{ ref('int_orders_operational') }}
GROUP BY date_date
ORDER BY date_date DESC
)
SELECT *
FROM t1
LEFT JOIN t2
USING(date_date)

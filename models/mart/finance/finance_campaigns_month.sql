WITH t1 AS (select
    CONCAT('2021-0',EXTRACT(MONTH FROM date_date),'-01') AS datemonth
    ,ads_margin
    ,average_basket
    ,operational_margin
FROM {{ ref('finance_campaigns_day') }}
)
select datemonth
    ,ROUND(SUM(ads_margin),2) AS ads_margin
    ,ROUND(SUM(average_basket),2) AS average_basket
    ,ROUND(SUM(operational_margin),2) AS operational_margin
FROM t1
GROUP BY datemonth
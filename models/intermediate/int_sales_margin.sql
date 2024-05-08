WITH t1 AS(
SELECT 
  date_date
  ,orders_id
  ,products_id
  ,revenue
  ,purchase_price
  ,quantity
FROM {{ ref('stg_raw__sales') }}
LEFT JOIN {{ ref('stg_raw__product') }}
  USING(products_id)
)
SELECT *
  ,ROUND(quantity*purchase_price,2) AS purchase_cost
  ,ROUND(revenue-quantity*purchase_price,2) AS margin
FROM t1
--5. Which product category generated the most profit for the "Wiltshire, UK" region in 2021?
SELECT 
    dp.category,
    SUM(o.product_quantity * (dp.sale_price - dp.cost_price)) AS profit
FROM 
    dim_store ds
INNER JOIN
    orders o ON ds.store_code = o.store_code
INNER JOIN
    dim_product dp ON o.product_code = dp.product_code 
WHERE
   ds.full_region = 'Wiltshire, UK'
   AND
   o.order_date BETWEEN '2021-01-01' AND '2021-12-31'
GROUP BY
    dp.category
ORDER BY
    profit DESC
;
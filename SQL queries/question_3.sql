--Which German store type had the highest revenue for 2022? 
SELECT 
    ds.store_type,
    SUM(o.product_quantity * dp.sale_price) AS revenue
FROM 
    dim_store ds
INNER JOIN
    orders o ON ds.store_code = o.store_code
INNER JOIN
    dim_product dp ON o.product_code = dp.product_code 
WHERE
   ds.country_code = 'DE'
   AND
   o.order_date BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY
    ds.store_type
ORDER BY
    revenue DESC
;
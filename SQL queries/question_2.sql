--Which month in 2022 has had the highest revenue?
SELECT 
    TO_CHAR(DATE(o.order_date), 'Month') AS month,
    SUM(o.product_quantity * dp.sale_price) AS revenue
FROM 
    orders o
INNER JOIN
    dim_product dp ON o.product_code = dp.product_code 
WHERE
    o.order_date BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY
    TO_CHAR(DATE(o.order_date), 'Month')
ORDER BY
    revenue DESC
;



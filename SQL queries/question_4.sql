--4. Create a view where the rows are the store types and the columns are the total sales, percentage of total sales and the count of orders 
WITH TotalSales AS (
    SELECT SUM(o.product_quantity * dp.sale_price) AS total
    FROM orders o
    INNER JOIN dim_product dp ON o.product_code = dp.product_code)
SELECT 
    ds.store_type,
    SUM(o.product_quantity * dp.sale_price) AS total_sales,
    SUM(o.product_quantity * dp.sale_price) * 100.0 / (SELECT total FROM TotalSales) AS percentage_sales,
    COUNT(o.order_date_uuid) AS no_orders
FROM 
    dim_store ds
INNER JOIN
    orders o ON ds.store_code = o.store_code
INNER JOIN
    dim_product dp ON o.product_code = dp.product_code 
GROUP BY
    ds.store_type;
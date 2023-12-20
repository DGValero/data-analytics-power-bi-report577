--How many staff are there in all of the UK stores? 
SELECT 
    SUM(staff_numbers) AS total_UK_employees
FROM 
    dim_store
WHERE 
    country = 'UK';

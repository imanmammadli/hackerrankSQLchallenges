WITH NEWCTE AS (
    SELECT 
        start_date, 
        DATEDIFF(DAY, '1900-01-01', start_date) - ROW_NUMBER() OVER (ORDER BY start_date) AS RANK
    FROM projects
)


SELECT 
    MIN(start_date) AS start_range, 
    DATEADD(DAY, 1, MAX(start_date)) AS end_range
FROM NEWCTE

GROUP BY RANK

ORDER BY 
    DATEDIFF(DAY, MIN(start_date), MAX(start_date)), 
    MIN(start_date);
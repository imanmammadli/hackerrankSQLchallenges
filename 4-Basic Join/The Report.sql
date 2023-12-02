-- Tables  : Students -> ST, Grades -> GR
-- Columns : id, name, marks

SELECT
    CASE
        WHEN GR.grade > 7 
            THEN ST.name
        ELSE NULL
    END AS Name, GR.grade, ST.marks
    
FROM Students AS ST JOIN GRADES AS GR ON ST.marks BETWEEN GR.min_mark AND GR.max_mark

ORDER BY GR.grade DESC, ST.Name ASC;

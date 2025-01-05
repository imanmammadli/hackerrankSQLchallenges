-- FUCTIONS TABLE -> FT

WHERE F1.X <= F1.Y
GROUP BY F1.X, F1.Y
HAVING F1.X!=F1.Y or COUNT(*)>1
ORDER BY F1.X;

SELECT F1.x, F1.y

FROM functions AS FT1
    JOIN functions AS FT2 ON FT1.x = FT2.y AND FT1.y = FT2.x

WHERE F1.x <= F1.y

GROUP BY F1.x, F1.y

HAVING F1.x < F1.y OR COUNT(*) > 1

ORDER BY F1.x;

-- FUCTIONS TABLE -> FT

SELECT FT1.x, FT1.y

FROM functions AS FT1
    JOIN functions AS FT2 ON FT1.x = FT2.y AND FT1.y = FT2.x

WHERE FT1.x <= FT1.y

GROUP BY FT1.x, FT1.y

HAVING FT1.x < FT1.y OR COUNT(*) > 1

ORDER BY FT1.x;

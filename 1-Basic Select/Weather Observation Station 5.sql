SELECT TOP 2 CITY, LEN(CITY) AS Len FROM STATION WHERE LEN(CITY)= (SELECT MAX(LEN(CITY)) FROM STATION)
        OR LEN(CITY) = (SELECT MIN(LEN(CITY)) FROM STATION) ORDER BY Len DESC, CITY ASC;
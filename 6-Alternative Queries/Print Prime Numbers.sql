DECLARE @i INT = 2;
DECLARE @j INT;
DECLARE @result VARCHAR(MAX) = '';

WHILE @i < 1000
BEGIN
    SET @j = 2
    WHILE (@j < @i)
    BEGIN
        IF (@i % @j=0)
            BREAK;
        SET @j = @j + 1
    END
    IF(@i = @j)
    BEGIN
        IF(@result <> '')
            SET @result += '&';
        SET @result += CAST(@i AS VARCHAR);
    END
    SET @i += 1
END
PRINT @result
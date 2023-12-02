DECLARE @RowCount int = 20;

WHILE @RowCount >= 1
BEGIN
    DECLARE @i int = 1, @pattern varchar(40) = '';
    WHILE @i <= @RowCount
    BEGIN
        SET @pattern = CONCAT(@pattern, '* ')
        set @i = @i + 1;
    END;

    SET @RowCount = @RowCount - 1;
    SELECT @pattern
END;
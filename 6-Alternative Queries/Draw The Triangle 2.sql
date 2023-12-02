DECLARE @RowCount int = 1;

WHILE @RowCount <= 20
BEGIN
    DECLARE @i int = 1, @pattern varchar(40) = '';
    WHILE @i <= @RowCount
    BEGIN
        SET @pattern = CONCAT(@pattern, '* ')
        set @i = @i + 1;
    END;

    SET @RowCount = @RowCount + 1;
    SELECT @pattern
END;
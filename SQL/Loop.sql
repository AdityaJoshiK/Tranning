DECLARE @Counter INT = 1;
DECLARE @TotalRows INT;

-- Get the total number of rows in the table
SELECT @TotalRows = COUNT(*) FROM [AdityaPractice].[dbo].[Employeenew];

-- Start the loop
WHILE @Counter <= @TotalRows
BEGIN
    -- Fetch the data for the current row
    SELECT
        [Id],
        [FullName],
        [Gender],
        [Age],
        [HireDate],
        [EmailAddress],
        [Salary],
        [PersonalWebSite]
    FROM
        [AdityaPractice].[dbo].[Employeenew]
    WHERE
        [Id] = @Counter;

    -- Replace the PRINT statement with your desired logic for each row
    PRINT 'Processing Row: ' + CAST(@Counter AS NVARCHAR(10));

    -- Increment the counter
    SET @Counter = @Counter + 1;
END

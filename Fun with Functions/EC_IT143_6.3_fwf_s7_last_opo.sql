USE EC_IT143_DA;
GO
-- Step 7: 0 Results Expected verification test for Last Name UDF
WITH TestCTE AS (
    SELECT 
        CASE WHEN CHARINDEX(' ', ContactName) > 0 THEN RIGHT(ContactName, LEN(ContactName) - CHARINDEX(' ', ContactName)) ELSE '' END AS AdHoc,
        dbo.fn_GetLastName(ContactName) AS UDF
    FROM dbo.t_w3_schools_customers
)
SELECT * FROM TestCTE WHERE AdHoc <> UDF; -- Target: 0 rows returned

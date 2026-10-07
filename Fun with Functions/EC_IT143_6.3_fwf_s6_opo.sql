USE EC_IT143_DA;
GO
-- Step 6: Compare UDF results side-by-side with the ad-hoc query
SELECT 
    ContactName,
    LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS AdHoc_FirstName,
    dbo.fn_GetFirstName(ContactName) AS UDF_FirstName
FROM dbo.t_w3_schools_customers;

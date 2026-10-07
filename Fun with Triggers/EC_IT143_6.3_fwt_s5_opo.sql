USE EC_IT143_DA;
GO
-- Step 5: Fire the trigger with a dummy update statement and check results
UPDATE dbo.t_w3_schools_customers
SET CustomerName = CustomerName
WHERE CustomerID = 1;

SELECT CustomerID, ContactName, last_modified_date, last_modified_by 
FROM dbo.t_w3_schools_customers 
WHERE CustomerID = 1;

USE EC_IT143_DA;
GO
-- =========================================================================
-- Author:      Ochieng Paulo Ochieng (opo)
-- Description: Step 4 - Create After-Update Trigger for Date and User Tracking
-- =========================================================================
CREATE OR ALTER TRIGGER dbo.tr_t_w3_schools_customers_AfterUpdate
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE dbo.t_w3_schools_customers
    SET last_modified_date = GETDATE(),
        last_modified_by = SUSER_NAME()
    FROM dbo.t_w3_schools_customers t
    INNER JOIN inserted i ON t.CustomerID = i.CustomerID;
END;
GO

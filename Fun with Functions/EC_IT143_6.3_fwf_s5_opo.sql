USE EC_IT143_DA;
GO
-- =========================================================================
-- Author:      Ochieng Paulo Ochieng (opo)
-- Description: Step 5 - Create User-Defined Scalar Function for First Name
-- =========================================================================
CREATE OR ALTER FUNCTION dbo.fn_GetFirstName (@FullName VARCHAR(100))
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @FirstName VARCHAR(100);
    SET @FirstName = CASE 
        WHEN CHARINDEX(' ', @FullName) > 0 
        THEN LEFT(@FullName, CHARINDEX(' ', @FullName) - 1)
        ELSE @FullName 
    END;
    RETURN @FirstName;
END;
GO

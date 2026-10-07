USE EC_IT143_DA;
GO
-- =========================================================================
-- Author:      Ochieng Paulo Ochieng (opo)
-- Description: Step 8 Loop - Scalar Function for Last Name Extraction
-- =========================================================================
CREATE OR ALTER FUNCTION dbo.fn_GetLastName (@FullName VARCHAR(100))
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @LastName VARCHAR(100);
    SET @LastName = CASE 
        WHEN CHARINDEX(' ', @FullName) > 0 
        THEN RIGHT(@FullName, LEN(@FullName) - CHARINDEX(' ', @FullName))
        ELSE '' 
    END;
    RETURN @LastName;
END;
GO

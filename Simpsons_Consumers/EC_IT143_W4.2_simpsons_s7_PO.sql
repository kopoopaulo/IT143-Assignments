USE EC_IT143_DA;
GO

/*****************************************************************************************************************
NAME:        Paulo Ochieng'
ASSIGNMENT:  W4.2 Final Project - Simpsons Data Manipulation
DATE:        September 24, 2026
PURPOSE:     Step 7 - Convert the ad hoc data load script into an automated stored procedure for transactions.
*****************************************************************************************************************/

CREATE OR ALTER PROCEDURE dbo.usp_simpsons_trans_count_load AS
BEGIN
    SET NOCOUNT ON;
    TRUNCATE TABLE EC_IT143_DA.dbo.t_simpsons_trans_count;
    INSERT INTO EC_IT143_DA.dbo.t_simpsons_trans_count (TotalTransactions) 
    SELECT TotalTransactions FROM EC_IT143_DA.dbo.v_simpsons_trans_count;
END;

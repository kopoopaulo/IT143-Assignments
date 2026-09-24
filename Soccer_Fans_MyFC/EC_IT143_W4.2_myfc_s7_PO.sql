USE EC_IT143_DA;
GO

/*****************************************************************************************************************
NAME:        Paulo Ochieng'
ASSIGNMENT:  W4.2 Final Project - MyFC Data Manipulation
DATE:        September 24, 2026
PURPOSE:     Step 7 - Convert the ad hoc data load script into an automated stored procedure.
*****************************************************************************************************************/

CREATE OR ALTER PROCEDURE dbo.usp_myfc_team_count_load AS
BEGIN
    SET NOCOUNT ON;
    TRUNCATE TABLE EC_IT143_DA.dbo.t_myfc_team_count;
    INSERT INTO EC_IT143_DA.dbo.t_myfc_team_count (TotalTeams) 
    SELECT TotalTeams FROM EC_IT143_DA.dbo.v_myfc_team_count;
END;

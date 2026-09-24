USE EC_IT143_DA;
GO

/*****************************************************************************************************************
NAME:        Paulo Ochieng'
ASSIGNMENT:  W4.2 Final Project - MyFC Data Manipulation
DATE:        September 24, 2026
PURPOSE:     Step 4 - Convert the team count ad hoc query into a permanent view database object.
*****************************************************************************************************************/

CREATE OR ALTER VIEW dbo.v_myfc_team_count AS 
SELECT COUNT(t_id) AS TotalTeams 
FROM MyFC.dbo.tblTeamDim;

USE EC_IT143_DA;
GO

/*****************************************************************************************************************
NAME:        Paulo Ochieng'
ASSIGNMENT:  W4.2 Final Project - Simpsons Data Manipulation
DATE:        September 24, 2026
PURPOSE:     Step 4 - Convert the main Visa transaction count ad hoc query into a permanent database view.
*****************************************************************************************************************/

CREATE OR ALTER VIEW dbo.v_simpsons_trans_count AS 
SELECT COUNT(*) AS TotalTransactions 
FROM Simpsons.dbo.FBS_Viza_Costmo;

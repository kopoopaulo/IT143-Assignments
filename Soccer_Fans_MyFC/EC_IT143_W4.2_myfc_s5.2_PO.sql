USE EC_IT143_DA;
GO

-- First, ensure the column is strictly altered to NOT NULL
ALTER TABLE EC_IT143_DA.dbo.t_myfc_team_count 
ALTER COLUMN TotalTeams INT NOT NULL;
GO

-- Second, apply the Primary Key constraint cleanly
ALTER TABLE EC_IT143_DA.dbo.t_myfc_team_count 
ADD CONSTRAINT PK_t_myfc_team_count PRIMARY KEY (TotalTeams);
GO

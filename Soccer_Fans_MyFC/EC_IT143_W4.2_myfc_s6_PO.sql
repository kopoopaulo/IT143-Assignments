TRUNCATE TABLE EC_IT143_DA.dbo.t_myfc_team_count;
INSERT INTO EC_IT143_DA.dbo.t_myfc_team_count (TotalTeams) SELECT TotalTeams FROM EC_IT143_DA.dbo.v_myfc_team_count;

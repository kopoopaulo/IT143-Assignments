USE EC_IT143_DA;
GO

CREATE OR ALTER PROCEDURE dbo.usp_hello_world_load AS
BEGIN
    SET NOCOUNT ON;
    TRUNCATE TABLE EC_IT143_DA.dbo.t_hello_world_destination;
    INSERT INTO EC_IT143_DA.dbo.t_hello_world_destination (MyMessage) 
    SELECT MyMessage FROM EC_IT143_DA.dbo.v_hello_world_source;
END;

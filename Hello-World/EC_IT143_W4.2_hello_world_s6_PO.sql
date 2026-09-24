TRUNCATE TABLE EC_IT143_DA.dbo.t_hello_world_destination;
INSERT INTO EC_IT143_DA.dbo.t_hello_world_destination (MyMessage) SELECT MyMessage FROM EC_IT143_DA.dbo.v_hello_world_source;

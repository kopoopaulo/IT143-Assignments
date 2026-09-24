ALTER TABLE EC_IT143_DA.dbo.t_hello_world_destination ALTER COLUMN MyMessage VARCHAR(50) NOT NULL;
ALTER TABLE EC_IT143_DA.dbo.t_hello_world_destination ADD CONSTRAINT PK_t_hello_world PRIMARY KEY (MyMessage);

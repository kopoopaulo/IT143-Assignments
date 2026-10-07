USE EC_IT143_DA;
GO

-- Clean up older variants to establish matching column schemas
IF OBJECT_ID('dbo.t_mock_person_address', 'U') IS NOT NULL 
    DROP TABLE dbo.t_mock_person_address;
GO

CREATE TABLE dbo.t_mock_person_address (
    AddressID INT IDENTITY(1,1) PRIMARY KEY,
    AddressLine1 VARCHAR(100),
    City VARCHAR(100), 
    PostalCode VARCHAR(20)
);
GO

IF OBJECT_ID('dbo.t_mock_production_product', 'U') IS NOT NULL 
    DROP TABLE dbo.t_mock_production_product;
GO

CREATE TABLE dbo.t_mock_production_product (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    [Name] VARCHAR(100),         -- Bracketed to protect column name
    ProductNumber VARCHAR(50),
    Color VARCHAR(50), 
    [ListPrice] MONEY            -- Bracketed to protect column name
);
GO

-- Re-populate mock datasets
INSERT INTO dbo.t_mock_person_address (AddressLine1, City, PostalCode) VALUES
('123 Main St', 'Bothell', '98011'), ('456 Oak Rd', 'Seattle', '98101'),
('999 Cedar Ave', 'Bothell', '98011');

INSERT INTO dbo.t_mock_production_product ([Name], ProductNumber, Color, [ListPrice]) VALUES
('Mountain Bike', 'BK-M18', 'Black', 1500.00), ('Road Bike', 'BK-R79', 'Red', 2500.00),
('Saddle', 'SD-M200', 'Black', 60.00);
GO

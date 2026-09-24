/*******************************************************************************
Course: IT 143 - Database Design and Analysis
Assignment: W3.4 Adventure Works — Create Answers
File Name: EC_IT143_W3.4_po.sql
Author: Paulo Ochieng
Date: September 15, 2026

Description: 
This script contains the 3 required learning resources followed by 8 
formatted business and metadata queries mapping cleanly to the custom table 
structures available within the local database instance.
*******************************************************************************/

-- Target your active local database instance
USE EC_IT143_DA; 
GO

/*
================================================================================
📚 THREE REQUIRED LEARNING RESOURCES
================================================================================
1. Stack Overflow Help Center - How do I write a good answer?
   URL: https://stackoverflow.com

2. LearnSQL Standard - 24 Rules to the SQL Formatting Standard
   URL: https://learnsql.com

3. Microsoft Learn - System Information Schema Views Reference (Transact-SQL)
   URL: https://microsoft.com
*/


--------------------------------------------------------------------------------
-- 🟢 CATEGORY 1: BUSINESS USER QUESTIONS — MARGINAL COMPLEXITY
--------------------------------------------------------------------------------

-- Q1 Business User question—Marginal complexity:
-- How many total customer records do we currently have on file?
-- Original Author: Paulo Ochieng

SELECT COUNT(*) AS [Total Customer Records]
FROM dbo.t_w3_schools_customers;


-- Q2 Business User question—Marginal complexity:
-- Can you provide a clean list of all unique countries where our customers live?
-- Original Author: Paulo Ochieng

SELECT DISTINCT Country AS [Customer Countries]
FROM dbo.t_w3_schools_customers
WHERE Country IS NOT NULL;


--------------------------------------------------------------------------------
-- 🟡 CATEGORY 2: BUSINESS USER QUESTIONS — MODERATE COMPLEXITY
--------------------------------------------------------------------------------

-- Q3 Business User question—Moderate complexity:
-- Can you display our customers sorted alphabetically by country, showing 
-- their full contact names alongside their city of residence?
-- Original Author: Paulo Ochieng

SELECT 
    CustomerName AS [Contact Name],
    City AS [City],
    Country AS [Country]
FROM dbo.t_w3_schools_customers
ORDER BY Country ASC, CustomerName ASC;


-- Q4 Business User question—Moderate complexity:
-- Which distinct cities within Germany contain our registered business customers?
-- Original Author: Paulo Ochieng

SELECT DISTINCT City AS [German Cities With Customers]
FROM dbo.t_w3_schools_customers
WHERE Country = 'Germany';


--------------------------------------------------------------------------------
-- 🔴 CATEGORY 3: BUSINESS USER QUESTIONS — INCREASED COMPLEXITY
--------------------------------------------------------------------------------

-- Q5 Business User question—Increased complexity:
-- A regional marketing manager needs to audit our European footprint. Can you 
-- compile a list of all clients located in France, Germany, or Spain, showing 
-- their company details ordered by their country designation?
-- Original Author: Paulo Ochieng

SELECT 
    CustomerName AS [Company Name],
    Address AS [Street Address],
    City AS [City],
    Country AS [Country]
FROM dbo.t_w3_schools_customers
WHERE Country IN ('France', 'Germany', 'Spain')
ORDER BY Country ASC;


-- Q6 Business User question—Increased complexity:
-- Our database administrator is verifying object synchronization. Can you run 
-- a validation check that shows all records pulled straight from our official 
-- customer view schema to ensure everything matches our base table rows?
-- Original Author: Paulo Ochieng

SELECT * 
FROM dbo.v_w3_schools_customers;


--------------------------------------------------------------------------------
-- 🔵 CATEGORY 4: METADATA QUESTIONS
--------------------------------------------------------------------------------

-- Q7 Metadata question:
-- Can you use the system information schema views to list all base table names 
-- that currently exist inside our database in a single column?
-- Original Author: Paulo Ochieng

SELECT TABLE_NAME AS [Database Base Tables]
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';


-- Q8 Metadata question:
-- Can you list the unique constraint types that exist within our database schema 
-- and count how many total constraints there are for each type?
-- Original Author: Paulo Ochieng

SELECT 
    CONSTRAINT_TYPE AS [Constraint Type],
    COUNT(*) AS [Total System Count]
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
GROUP BY CONSTRAINT_TYPE;

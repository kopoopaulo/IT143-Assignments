/*****************************************************************************************************************
NAME:    Paulo Ochieng'
PURPOSE: Final Project: My Communities Analysis - Create Answers for Data Analytics Community Data Set
         Contains 4 business questions and their corresponding T-SQL data manipulation answers.
*****************************************************************************************************************/

-- =====================================================================================
-- TEMPORARY SETUP: Create table and insert mock data to prevent Invalid Object Name errors
-- =====================================================================================
IF OBJECT_ID('tempdb..#t_employee_salary') IS NOT NULL DROP TABLE #t_employee_salary;

CREATE TABLE #t_employee_salary (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    employee_salary INT
);

-- Populate Employee Data
INSERT INTO #t_employee_salary VALUES 
(1, 'Rowan Shepherd', 1, 1000),
(2, 'Rimsha Mclendon', 1, 900),
(3, 'Tiah Sanford', 1, 900),
(4, 'Cayden Mcclure', 1, 700),
(5, 'Elena Dyer', 2, 1200),
(6, 'Marcus Knox', 2, 800),
(7, 'Tristan Ashby', 2, 700),
(8, 'Arif Sutherland', 2, 500);

-- =====================================================================================
-- CORE ASSIGNMENT QUERIES
-- =====================================================================================

-- Q1: Who are the top three employees earning the highest salaries within each distinct department?
-- Author: Paulo Ochieng'
SELECT 
    e1.employee_id,
    e1.employee_name,
    e1.department_id,
    e1.employee_salary
FROM 
    #t_employee_salary e1
WHERE 
    (
        SELECT COUNT(DISTINCT e2.employee_salary) 
        FROM #t_employee_salary e2 
        WHERE e2.department_id = e1.department_id 
          AND e2.employee_salary > e1.employee_salary
    ) < 3
ORDER BY 
    department_id, 
    employee_salary DESC;


-- Q2: What is the total payroll cost allocated to each individual department id?
-- Author: [Insert Classmate Name 3]
SELECT 
    department_id, 
    SUM(employee_salary) AS total_department_payroll
FROM 
    #t_employee_salary
GROUP BY 
    department_id;


-- Q3: How many total employees are tracked within our database platform ecosystem?
-- Author: Paulo Ochieng'
SELECT 
    COUNT(DISTINCT employee_id) AS overall_employee_count
FROM 
    #t_employee_salary;


-- Q4: What is the average salary across all departments for employees listed in the database?
-- Author: [Insert Classmate Name 4]
SELECT 
    AVG(employee_salary) AS overall_average_salary
FROM 
    #t_employee_salary;

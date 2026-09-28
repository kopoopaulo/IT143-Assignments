/*****************************************************************************************************************
NAME:    Paulo Ochieng'
PURPOSE: Final Project: My Communities Analysis - Create Answers for Library Community Data Set
         Contains 4 business questions and their corresponding T-SQL data manipulation answers.
*****************************************************************************************************************/

-- =====================================================================================
-- TEMPORARY SETUP: Create tables and insert mock data to prevent Invalid Object Name errors
-- =====================================================================================
IF OBJECT_ID('tempdb..#t_patrons_dim') IS NOT NULL DROP TABLE #t_patrons_dim;
IF OBJECT_ID('tempdb..#t_library_circulation_fact') IS NOT NULL DROP TABLE #t_library_circulation_fact;

CREATE TABLE #t_patrons_dim (
    patron_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    home_postal_code VARCHAR(10),
    membership_status VARCHAR(20)
);

CREATE TABLE #t_library_circulation_fact (
    media_id INT,
    patron_id INT,
    isbn_number VARCHAR(20),
    literary_genre_classification VARCHAR(30),
    checkout_date DATE,
    loan_duration_days INT,
    overdue_fine_amount DECIMAL(5,2)
);

-- Populate Patrons
INSERT INTO #t_patrons_dim VALUES 
(10452, 'Sarah', 'Jenkins', '90210', 'Active'),
(10453, 'John', 'Doe', '90210', 'Active'),
(10454, 'Jane', 'Smith', '30030', 'Expired'),
(10455, 'Alex', 'Jones', '30030', 'Active');

-- Populate Circulation Facts
INSERT INTO #t_library_circulation_fact VALUES 
(1, 10452, '978-3-16-148410-0', 'Fiction', '2026-09-15', 14, 2.50),
(2, 10453, '978-0-12-374856-0', 'History', '2026-09-10', 21, 6.00),
(3, 10452, '978-0-59-652068-7', 'Science', '2026-09-20', 7, 0.00),
(1, 10454, '978-3-16-148410-0', 'Fiction', '2026-08-01', 14, 1.50);

-- =====================================================================================
-- CORE ASSIGNMENT QUERIES
-- =====================================================================================

-- Q1: What is the total count of active library patrons in each home postal code?
-- Author: Paulo Ochieng'
SELECT 
    home_postal_code, 
    COUNT(patron_id) AS total_active_patrons
FROM 
    #t_patrons_dim
WHERE 
    membership_status = 'Active'
GROUP BY 
    home_postal_code;


-- Q2: Which 3 media items have accumulated the highest total late fees?
-- Author: [Insert Classmate Name 1]
SELECT TOP 3
    isbn_number,
    literary_genre_classification,
    SUM(overdue_fine_amount) AS total_fines_collected
FROM 
    #t_library_circulation_fact
GROUP BY 
    isbn_number, literary_genre_classification
ORDER BY 
    total_fines_collected DESC;


-- Q3: What is the average loan duration in days for books checked out in September 2026?
-- Author: Paulo Ochieng'
SELECT 
    AVG(loan_duration_days) AS average_loan_days
FROM 
    #t_library_circulation_fact
WHERE 
    checkout_date BETWEEN '2026-09-01' AND '2026-09-30';


-- Q4: What are the details of patrons who currently have an outstanding fine balance greater than $5.00?
-- Author: [Insert Classmate Name 2]
SELECT 
    p.patron_id, 
    p.first_name, 
    p.last_name, 
    SUM(f.overdue_fine_amount) AS current_balance
FROM 
    #t_library_circulation_fact f
JOIN 
    #t_patrons_dim p ON f.patron_id = p.patron_id
GROUP BY 
    p.patron_id, p.first_name, p.last_name
HAVING 
    SUM(f.overdue_fine_amount) > 5.00;

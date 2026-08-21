USE hr_analysis;

DESCRIBE `hr-employee-attrition`;

SELECT * 
FROM `hr-employee-attrition`
LIMIT 10;


-- =====================================================
-- OVERALL ATTRITION ANALYSIS
-- =====================================================

-- 1. Total Number of Employees
SELECT COUNT(*) AS Total_Employees
FROM `hr-employee-attrition`;

-- 2.Attrition Count
SELECT 
    Attrition,
    COUNT(*) AS Employee_count
FROM `hr-employee-attrition`
GROUP BY Attrition;

-- 3. Overall Attrition Rate
SELECT ROUND(SUM(Attrition = 'Yes'  ) * 100/ COUNT(*),2)
AS Attrition_rate
FROM `hr-employee-attrition`;

-- ==================================================
-- ATTRITIOIN BY DEPARTMENT
-- ==================================================

-- 1. Attrition Rate by Deparment


SELECT 
Department,
COUNT(*) AS Employee_count, 
SUM(Attrition = 'YES') AS Employee_left,
ROUND(SUM(Attrition = 'YES') * 100/ COUNT(*), 2) AS Attrition_rate
FROM `hr-employee-attrition`
group by Department
ORDER BY employee_count DESC;

-- 2. Attrition Breakdown by Department

SELECT 
    Department,
    Attrition,
    COUNT(*) AS employee_count
FROM `hr-employee-attrition`
GROUP BY Department, Attrition
ORDER BY Department, Attrition;


-- =========================================
-- ATTRITION BY JOB ROLE
-- =========================================

SELECT 
    `Job Role`,
    COUNT(*) AS Employee_count,
    SUM(Attrition = 'Yes') AS Employee_left,
    ROUND(SUM(Attrition = 'Yes') * 100 / COUNT(*),
            2) AS Job_attrition_rate
FROM
    `hr-employee-attrition`
GROUP BY `Job Role`
ORDER BY Job_attrition_rate DESC;

-- =========================================
-- ATTRITION BY OVERTIME
-- =========================================

SELECT 
    Overtime,
    COUNT(*) AS Employee_count,
    SUM(Attrition = 'Yes') AS Employees_left,
    ROUND(SUM(Attrition = 'Yes') * 100 / COUNT(*),
            2) AS Overtime_rate
FROM
    `hr-employee-attrition`
GROUP BY Overtime
ORDER BY Overtime_rate DESC;

-- =========================================
-- ATTRITION BY BUSINESS TRAVEL
-- =========================================
SELECT 
    BusinessTravel,
    COUNT(*) AS Total_employees,
    SUM(Attrition = 'Yes') AS Employees_left,
    ROUND(SUM(Attrition = 'Yes') * 100 / COUNT(*),
            2) AS businesstravel_rate
FROM
    `hr-employee-attrition`
GROUP BY BusinessTravel
ORDER BY businesstravel_rate

-- =========================================
-- ATTRITION BY AGE GROUP
-- =========================================

SELECT
    CASE
        WHEN Age <= 25 THEN '18-25'
        WHEN Age <= 35 THEN '26-35'
        WHEN Age <= 45 THEN '36-45'
        WHEN Age <= 55 THEN '46-55'
        ELSE '56-65'
    END AS Age_group,
    COUNT(*) AS Total_employee,
    SUM(Attrition = 'Yes') AS employee_left,
    ROUND(SUM(Attrition = 'Yes') * 100 / COUNT(*),
            2) AS age_attrition_rate
FROM
    `hr-employee-attrition`
GROUP BY Age_group
ORDER BY Age_group ASC;
        
-- =========================================
-- ATTRITION BY MONTHLY INCOME
-- =========================================

SELECT 
    CASE
        WHEN `Monthly Income` < 3000 THEN '0-3K'
        WHEN `Monthly Income` < 5000 THEN '3K-5K'
        WHEN `Monthly Income` < 7000 THEN '5K-7K'
        WHEN `Monthly Income` < 10000 THEN '7K-10K'
        ELSE '10K+'
    END AS Income_Group,

    COUNT(*) AS Employee_count,

    SUM(Attrition = 'Yes') AS Employees_left,

    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_rate

FROM `hr-employee-attrition`

GROUP BY Income_Group
ORDER BY Attrition_rate DESC;

-- =========================================
-- ATTRITION BY YEARS AT COMPANY
-- =========================================

SELECT 
    CASE
        WHEN `Years At Company` BETWEEN 0 AND 2 THEN '0-2 Years'
        WHEN `Years At Company` BETWEEN 3 AND 5 THEN '3-5 Years'
        WHEN `Years At Company` BETWEEN 6 AND 10 THEN '6-10 Years'
        WHEN `Years At Company` BETWEEN 11 AND 15 THEN '11-15 Years'
        ELSE '16+ Years'
    END AS Tenure_Group,

    COUNT(*) AS Employee_count,

    SUM(Attrition = 'Yes') AS Employees_left,

    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_rate

FROM `hr-employee-attrition`

GROUP BY Tenure_Group
ORDER BY Attrition_rate DESC;

-- =========================================
-- ATTRITION BY DISTANCE FROM HOME
-- =========================================

SELECT 
    CASE
        WHEN `Distance From Home` BETWEEN 0 AND 5 THEN '0-5'
        WHEN `Distance From Home`BETWEEN 6 AND 10 THEN '6-10'
        WHEN `Distance From Home`BETWEEN 11 AND 20 THEN '11-20'
        WHEN `Distance From Home`BETWEEN 21 AND 30 THEN '21-30'
        ELSE '30+'
    END AS Distance_Group,

    COUNT(*) AS Employee_count,

    SUM(Attrition = 'Yes') AS Employees_left,

    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_rate

FROM `hr-employee-attrition`

GROUP BY Distance_Group
ORDER BY Attrition_rate DESC;

-- =========================================
-- ATTRITION BY WORK-LIFE BALANCE
-- =========================================

SELECT 
    `Work Life Balance`,
    COUNT(*) AS Employee_count,
    SUM(Attrition = 'Yes') AS Employees_left,
    ROUND(SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
            2) AS Attrition_rate
FROM
    `hr-employee-attrition`
GROUP BY  `Work Life Balance`
ORDER BY Attrition_rate DESC;

-- =========================================
-- ATTRITION BY STOCK OPTION LEVEL
-- =========================================

SELECT 
    `Stock Option Level`,
    COUNT(*) AS Employee_count,
    SUM(Attrition = 'Yes') AS Employees_left,
    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_rate
FROM `hr-employee-attrition`
GROUP BY `Stock Option Level`
ORDER BY Attrition_rate DESC;

-- =========================================
-- ATTRITION BY JOB SATISFACTION
-- =========================================

SELECT 
    `Job Satisfaction`,
    COUNT(*) AS Employee_count,
    SUM(Attrition = 'Yes') AS Employees_left,
    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_rate
FROM `hr-employee-attrition`
GROUP BY `Job Satisfaction`
ORDER BY Attrition_rate DESC;

-- =========================================
-- ATTRITION BY JOB INVOLVEMENT
-- =========================================

SELECT 
    `Job Involvement`,
    COUNT(*) AS Employee_count,
    SUM(Attrition = 'Yes') AS Employees_left,
    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_rate
FROM `hr-employee-attrition`
GROUP BY `Job Involvement`
ORDER BY Attrition_rate DESC;

-- =========================================
-- ATTRITION BY YEARS SINCE LAST PROMOTION
-- =========================================

SELECT 
    CASE
        WHEN `Years Since Last Promotion` = 0 THEN '0 Years'
        WHEN `Years Since Last Promotion` BETWEEN 1 AND 2 THEN '1-2 Years'
        WHEN `Years Since Last Promotion` BETWEEN 3 AND 5 THEN '3-5 Years'
        ELSE '6+ Years'
    END AS Promotion_Group,

    COUNT(*) AS Employee_count,

    SUM(Attrition = 'Yes') AS Employees_left,

    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_rate

FROM `hr-employee-attrition`

GROUP BY Promotion_Group
ORDER BY Attrition_rate DESC;

-- =========================================
-- ATTRITION BY MARITAL STATUS
-- =========================================

SELECT 
    `Marital Status`,
    COUNT(*) AS Employee_count,
    SUM(Attrition = 'Yes') AS Employees_left,
    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_rate
FROM `hr-employee-attrition`
GROUP BY `Marital Status`
ORDER BY Attrition_rate DESC;

-- =========================================
-- ATTRITION BY GENDER
-- =========================================

SELECT 
    Gender,
    COUNT(*) AS Employee_count,
    SUM(Attrition = 'Yes') AS Employees_left,
    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_rate
FROM `hr-employee-attrition`
GROUP BY Gender
ORDER BY Attrition_rate DESC;

-- =========================================
-- ATTRITION BY MARITAL STATUS AND GENDER
-- =========================================

SELECT 
    `Marital Status`,
    Gender,
    COUNT(*) AS Employee_count,
    SUM(Attrition = 'Yes') AS Employees_left,
    ROUND(
        SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS Attrition_rate
FROM `hr-employee-attrition`
GROUP BY `Marital Status`, Gender
ORDER BY Attrition_rate DESC;

-- =========================================
-- ADVANCED SQL: CTE
-- =========================================

WITH JobRole_Attrition AS (

    SELECT 
        `Job Role`,
        COUNT(*) AS Employee_count,
        SUM(Attrition = 'Yes') AS Employees_left,
        ROUND(
            SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
            2
        ) AS Attrition_rate

    FROM `hr-employee-attrition`

    GROUP BY `Job Role`
)

SELECT *
FROM JobRole_Attrition
ORDER BY Attrition_rate DESC;

-- =========================================
-- JOB ROLE RANKING BY ATTRITION
-- =========================================

WITH JobRole_Attrition AS (

    SELECT 
        `Job Role`,
        COUNT(*) AS Employee_count,
        SUM(Attrition = 'Yes') AS Employees_left,
        ROUND(
            SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
            2
        ) AS Attrition_rate

    FROM `hr-employee-attrition`

    GROUP BY `Job Role`
)

SELECT 
  `Job Role`,
    Employee_count,
    Employees_left,
    Attrition_rate,
    RANK() OVER (
        ORDER BY Attrition_rate DESC
    ) AS Attrition_Rank

FROM JobRole_Attrition
ORDER BY Attrition_Rank;

-- =========================================
-- TOP JOB ROLE WITHIN EACH DEPARTMENT
-- =========================================

WITH Department_Roles AS (

    SELECT 
        Department,
        `Job Role`,
        COUNT(*) AS Employee_count,
        SUM(Attrition = 'Yes') AS Employees_left,
        ROUND(
            SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
            2
        ) AS Attrition_rate

    FROM `hr-employee-attrition`

    GROUP BY Department, `Job Role`
),

Ranked_Roles AS (

    SELECT 
        Department,
        `Job Role`,
        Employee_count,
        Employees_left,
        Attrition_rate,

        RANK() OVER (
            PARTITION BY Department
            ORDER BY Attrition_rate DESC
        ) AS Role_Rank

    FROM Department_Roles
)

SELECT *
FROM Ranked_Roles
WHERE Role_Rank = 1
ORDER BY Department;

-- =========================================
-- FINAL HR ATTRITION SUMMARY
-- =========================================

WITH Department_Summary AS (

    SELECT 
        Department,
        COUNT(*) AS Employee_count,
        SUM(Attrition = 'Yes') AS Employees_left,
        ROUND(
            SUM(Attrition = 'Yes') * 100.0 / COUNT(*),
            2
        ) AS Attrition_rate

    FROM `hr-employee-attrition`

    GROUP BY Department
)

SELECT 
    Department,
    Employee_count,
    Employees_left,
    Attrition_rate,
    RANK() OVER (
        ORDER BY Attrition_rate DESC
    ) AS Attrition_Rank

FROM Department_Summary

ORDER BY Attrition_Rank;


-- =========================================
-- FINAL BUSINESS INSIGHTS
-- =========================================

-- 1. Overall Attrition:
-- 237 employees left the organization, resulting in an
-- overall attrition rate of approximately 16.12%.


-- 2. Job Role:
-- Sales Representatives have the highest attrition rate
-- at approximately 39.76%.


-- 3. Overtime:
-- Employees working overtime show approximately 30.53% attrition,
-- indicating a potential relationship between workload and turnover.


-- 4. Age:
-- Employees aged 18-25 show approximately 34.78% attrition,
-- indicating higher turnover among younger employees.


-- 5. Tenure:
-- Employees with 0-2 years at the company show approximately
-- 29.82% attrition, highlighting early tenure as a critical
-- retention period.


-- 6. Business Travel:
-- Employees who travel frequently show approximately 24.91%
-- attrition, compared with 8.00% among non-travel employees.


-- 7. Work-Life Balance:
-- Employees with poor work-life balance show approximately
-- 31.25% attrition.


-- 8. Monthly Income:
-- Employees in the 0-3K income group show approximately
-- 28.61% attrition, suggesting compensation may be relevant
-- to employee retention.


-- 9. Distance From Home:
-- Employees living 20-30 km from work show approximately
-- 22.06% attrition, indicating a potential relationship
-- between commuting distance and turnover.


-- 10. Stock Options:
-- Employees with Stock Option Level 0 show approximately
-- 24.41% attrition, suggesting financial incentives may
-- play a role in employee retention.
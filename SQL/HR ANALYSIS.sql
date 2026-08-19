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
        WHEN Monthly Income < 3000 THEN '0-3K'
        WHEN Monthly Income < 5000 THEN '3K-5K'
        WHEN Monthly Income < 7000 THEN '5K-7K'
        WHEN Monthly Income < 10000 THEN '7K-10K'
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






-- -----------------------------------------------------------
-- Assuming the following tables have been created and populated:
-- accounting.Employees, accounting.Departments, etc.
-- -----------------------------------------------------------

-- 1) SELECT and FROM: Getting Data [cite: 5, 6]
-- Retrieves specific columns (FirstName, LastName) from the Employees table.
SELECT
    EmployeeID,
    FirstName,
    LastName,
    DepartmentID
FROM
    Employees;

-- Tip: Use LIMIT to restrict output to prevent large result sets[cite: 11].
SELECT *
FROM Employees
LIMIT 5;

-- -----------------------------------------------------------

-- 2) WHERE: Filtering Data [cite: 12, 13]
-- Filters the records to find employees in Department ID 10.
SELECT
    FirstName,
    LastName
FROM
    Employees
WHERE
    DepartmentID = 10;

-- Using BETWEEN to find employees with IDs within a specific range[cite: 16, 18].
SELECT
    *
FROM
    Employees
WHERE
    EmployeeID BETWEEN 105 AND 110;

-- Using OR and ILIKE (PostgreSQL case-insensitive search)[cite: 16, 43].
SELECT
    FirstName,
    LastName
FROM
    Employees
WHERE
    FirstName ILIKE 'A%' OR FirstName ILIKE 'J%';

-- -----------------------------------------------------------

-- 3) ORDER BY: Sorting [cite: 19, 20]
-- Sorts employees by their LastName in descending (Z-A) order[cite: 22].
SELECT
    FirstName,
    LastName
FROM
    Employees
ORDER BY
    LastName DESC;

-- Sorts by DepartmentID, then by FirstName (ascending is default).
SELECT
    *
FROM
    Employees
ORDER BY
    DepartmentID, FirstName;

-- -----------------------------------------------------------

-- 4) Aggregation and GROUP BY [cite: 23, 24]
-- Aggregation uses functions like COUNT(), SUM(), AVG(), MIN(), MAX()[cite: 25].
-- Groups the employees by DepartmentID and counts how many employees are in each department[cite: 27].
SELECT
    DepartmentID,
    COUNT(EmployeeID) AS EmployeeCount
FROM
    Employees
GROUP BY
    DepartmentID;

-- HAVING: Filtering Grouped Data [cite: 28]
-- Filters the results of the GROUP BY, showing only departments with more than 3 employees[cite: 29].
SELECT
    DepartmentID,
    COUNT(EmployeeID) AS EmployeeCount
FROM
    Employees
GROUP BY
    DepartmentID
HAVING
    COUNT(EmployeeID) > 3;

-- -----------------------------------------------------------

-- 5) Joins: Combining Tables (INNER JOIN) [cite: 30, 31]
-- Combines the Employees and Departments tables to see the name of each employee's department.
SELECT
    E.FirstName,
    E.LastName,
    D.DepartmentName
FROM
    Employees E -- E is an alias for Employees
INNER JOIN
    Departments D ON E.DepartmentID = D.DepartmentID; -- The common column used for linking

-- -----------------------------------------------------------

-- 6) Subqueries: Query inside another query [cite: 37]
-- Finds the list of employees whose DepartmentID matches the DepartmentID of the 'HR' department.
SELECT
    FirstName,
    LastName
FROM
    Employees
WHERE
    DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'HR');

-- -----------------------------------------------------------

-- 7) PostgreSQL Special Tip: COALESCE()
-- COALESCE() replaces NULL values with a specified value[cite: 44].
-- This shows 'Unassigned' instead of NULL for employees without a DepartmentID.
SELECT
    FirstName,
    COALESCE(CAST(DepartmentID AS VARCHAR), 'Unassigned') AS DepartmentStatus
FROM
    Employees;
-- 3. Join Demonstrations
--

-- A. INNER JOIN: Matches records that have values in BOTH tables.
SELECT
    E.FirstName,
    E.LastName,
    D.DepartmentName
FROM
    Employees E
INNER JOIN
    Departments D ON E.DepartmentID = D.DepartmentID;
-- Expected Result: 7 records (Employees 106 and 108 are excluded as their DeptIDs are not in Departments)

---

-- B. LEFT (OUTER) JOIN: Returns ALL records from the LEFT table (Employees),
-- and the matched records from the RIGHT table (Departments).
-- NULL is returned for the right side columns if there is no match.
SELECT
    E.FirstName,
    E.LastName,
    D.DepartmentName
FROM
    Employees E
LEFT JOIN
    Departments D ON E.DepartmentID = D.DepartmentID;
-- Expected Result: 10 records (Includes Frank and Henry, with NULL DepartmentName for them)

---

-- C. RIGHT (OUTER) JOIN: Returns ALL records from the RIGHT table (Departments),
-- and the matched records from the LEFT table (Employees).
-- NULL is returned for the left side columns if there is no match.
SELECT
    E.FirstName,
    E.LastName,
    D.DepartmentName
FROM
    Employees E
RIGHT JOIN
    Departments D ON E.DepartmentID = D.DepartmentID;
-- Expected Result: 9 records (Includes Marketing (ID 50) and Finance (ID 60), with NULL employee names)

---

-- D. FULL (OUTER) JOIN: Returns ALL records when there is a match in EITHER left or right table.
-- Where there is no match, the side without a match will have NULL.
-- NOTE: Full JOIN syntax may vary or not be supported in all SQL dialects (e.g., MySQL requires UNION of LEFT and RIGHT JOINs).
-- Assuming standard SQL syntax:
SELECT
    E.FirstName,
    E.LastName,
    D.DepartmentName
FROM
    Employees E
FULL OUTER JOIN
    Departments D ON E.DepartmentID = D.DepartmentID;
-- Expected Result: 12 records (Includes Frank, Henry, Marketing, and Finance, showing all non-matching records)

---

-- E. Using INNER JOIN for Many-to-Many Relationship (Employees to Projects)
SELECT
    E.FirstName,
    E.LastName,
    P.ProjectName,
    EP.HoursWorked
FROM
    Employees E
INNER JOIN
    EmployeeProjects EP ON E.EmployeeID = EP.EmployeeID
INNER JOIN
    Projects P ON EP.ProjectID = P.ProjectID
ORDER BY
    E.FirstName;
-- Expected Result: 8 records (Only employees who are currently assigned to a project)
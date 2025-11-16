CREATE SCHEMA accounting;

SET search_path TO accounting;

--
-- 1. Table Creation
--

-- Table 1: Employees (The 'left' table in many joins)
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DepartmentID INT
);

-- Table 2: Departments (The 'right' table in many joins)
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL,
    ManagerID INT
);

-- Table 3: Projects
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL,
    Budget DECIMAL(10, 2)
);

-- Table 4: EmployeeProjects (A linking table for a many-to-many relationship)
CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT,
    HoursWorked INT,
    PRIMARY KEY (EmployeeID, ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);


--
-- 2. Data Insertion (15-20 records total across tables)
--

-- Employees (10 Records)
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID) VALUES
(101, 'Alice', 'Smith', 10),
(102, 'Bob', 'Johnson', 20),
(103, 'Charlie', 'Brown', 10),
(104, 'Diana', 'Prince', 30),
(105, 'Eve', 'Adams', 20),
(106, 'Frank', 'Taylor', 40), -- Dept 40 doesn't exist in Departments table (will show in LEFT JOIN)
(107, 'Grace', 'Lee', 30),
(108, 'Henry', 'Wilson', NULL), -- No Department (will show in LEFT JOIN)
(109, 'Ivy', 'King', 10),
(110, 'Jake', 'Miller', 20);

-- Departments (5 Records)
INSERT INTO Departments (DepartmentID, DepartmentName, ManagerID) VALUES
(10, 'Sales', 101),
(20, 'IT', 102),
(30, 'HR', 104),
(50, 'Marketing', 115), -- Dept 50 has no employees (will show in RIGHT/FULL JOIN)
(60, 'Finance', 100);

-- Projects (5 Records)
INSERT INTO Projects (ProjectID, ProjectName, Budget) VALUES
(1, 'Alpha', 50000.00),
(2, 'Beta', 75000.00),
(3, 'Gamma', 10000.00),
(4, 'Delta', 120000.00),
(5, 'Epsilon', 30000.00);

-- EmployeeProjects (8 Records)
INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked) VALUES
(101, 1, 120),
(102, 1, 80),
(102, 2, 40),
(104, 3, 60),
(105, 4, 150),
(109, 2, 75),
(109, 5, 30),
(110, 4, 90); -- Note: Employee 103, 106, 107, 108 are not on any project.
CREATE TABLE Departments (
    department_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    building TEXT NOT NULL,
    budget INTEGER DEFAULT 100000
);

CREATE TABLE Employees (
    employee_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    salary REAL NOT NULL,
    seniority INTEGER NOT NULL,
    department_id INTEGER,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);


15.
SELECT Employees.*,
    Departments.name AS department_name,
    Departments.building AS department_building,
    Departments.budget AS department_budget
FROM Employees
INNER JOIN Departments ON Employees.department_id = Departments.department_id;


16.
SELECT Employees.*,
    Departments.name AS department_name,
    Departments.building AS department_building,
    Departments.budget AS department_budget
FROM Employees
LEFT JOIN Departments ON Employees.department_id = Departments.department_id;


17.
SELECT Employees.*,
    Departments.name AS department_name,
    Departments.building AS department_building,
    Departments.budget AS department_budget
FROM Employees
LEFT JOIN Departments ON Employees.department_id = Departments.department_id
WHERE Departments.department_id IS NULL;


18.
SELECT COUNT(*) AS total_employees
FROM Employees;

SELECT Departments.name AS department_name, COUNT(Employees.employee_id) AS employee_count
FROM Departments
LEFT JOIN Employees ON Departments.department_id = Employees.department_id
GROUP BY Employees.department_id, Departments.name
ORDER BY employee_count DESC


19.
SELECT Departments.name AS department_name,
    AVG(Employees.salary) AS average_salary
FROM Employees
INNER JOIN Departments ON Employees.department_id = Departments.department_id
GROUP BY Employees.department_id;


20.
SELECT Departments.name AS department_name,
    MAX(Employees.salary) AS highest_salary
FROM Employees
INNER JOIN Departments ON Employees.department_id = Departments.department_id
GROUP BY Employees.department_id;


21.
SELECT Employees.*,
    Departments.name AS department_name,
    Departments.building AS department_building,
    Departments.budget AS department_budget
FROM Employees
INNER JOIN Departments ON Employees.department_id = Departments.department_id
ORDER BY Employees.seniority ASC;


22.
SELECT Employees.seniority,
	ROUND(AVG(Employees.salary), 2) AS average_salary
FROM Employees
GROUP BY Employees.seniority
ORDER BY Employees.seniority ASC;

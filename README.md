# 💾 MySQL Assignment 2 – Querying Data

## 📘 Overview
This project demonstrates fundamental **MySQL database creation and data querying** techniques.  
It includes database creation, table relationships using foreign keys, data insertion, and examples of SQL queries such as filtering, aggregation, grouping, and joins.

## 🗂️ Database Details

### 🏢 Database Name
`employee_db`

## 📋 Table Structure

### 1. Departments
Stores information about company departments.

| Column Name     | Data Type      | Key Type     | Description                      |
|-----------------|----------------|---------------|----------------------------------|
| department_id   | INT            | PRIMARY KEY   | Unique identifier for department |
| department_name | VARCHAR(100)   | UNIQUE, NOT NULL | Name of the department         |

### 2. Location
Stores information about office locations.

| Column Name  | Data Type     | Key Type     | Description                      |
|---------------|---------------|---------------|----------------------------------|
| location_id   | INT           | PRIMARY KEY   | Unique identifier for location   |
| location      | VARCHAR(30)   | NOT NULL      | City or place name               |

### 3. Employees
Stores employee details with foreign key references to `departments` and `location`.

| Column Name     | Data Type        | Key Type       | Description |
|-----------------|------------------|----------------|--------------|
| employee_id     | INT AUTO_INCREMENT | PRIMARY KEY | Unique employee ID |
| employee_Name   | VARCHAR(50)      | NOT NULL | Employee name |
| Gender          | ENUM('M','F')    | | Gender |
| Age             | INT              | CHECK(Age >= 18) | Employee age |
| hire_date       | DATE             | DEFAULT CURRENT_DATE | Hire date |
| designation     | VARCHAR(100)     | | Job title |
| department_id   | INT              | FOREIGN KEY | References `departments(department_id)` |
| location_id     | INT              | FOREIGN KEY | References `location(location_id)` |
| Salary          | DECIMAL(10,2)    | | Monthly salary |


## 🔧 Table Relationships
- `employees.department_id` → references `departments.department_id`  
- `employees.location_id` → references `location.location_id`  
- Both use `ON DELETE CASCADE` and `ON UPDATE CASCADE`


## 💾 Data Insertion

### Insert Departments
```sql
INSERT INTO departments(department_id, department_name)
VALUES 
(1, 'HR'),
(2, 'ACCOUNTS'),
(3, 'FINANCE'),
(4, 'DOCUMENTATION');
Insert Locations
sql
Copy code
INSERT INTO location(location_id, Location)
VALUES
(1, 'Madurai'),
(2, 'Chennai'),
(3, 'Salem'),
(4, 'Trichy'),
(5, 'Tiruppur'),
(6, 'Ooty'),
(7, 'Kanniyakumari'),
(8, 'Sivagangai'),
(9, 'Coimbatore'),
(10, 'Namakkal');
Insert Employees
sql
Copy code
INSERT INTO employees(employee_Name, Gender, Age, hire_date, designation, department_id, location_id, Salary)
VALUES
('Raja', 'M', 30, '2024-08-25', 'Analyst', 2, 4, 45000),
('Mani', 'M', 35, '2018-07-15', 'HR Manager', 1, 3, 65000),
('Kala', 'F', 38, '2015-08-12', NULL, 4, 2, 52000),
('Kavi', 'F', 43, '2012-05-10', 'Analyst', 1, 5, 80000),
('Sami', 'F', 42, '2015-06-01', NULL, 4, 1, 77000),
('Kiruba', 'F', 38, '2016-03-03', 'Analyst', 3, 7, 55000),
('Kannan', 'M', 45, '2018-09-30', 'Finance Manager', 3, 6, 85000),
('Deva', 'M', 26, '2015-10-16', NULL, 1, 9, 68000),
('Muthu', 'M', 31, '2019-02-12', NULL, 4, 10, 35000),
('Mithu', 'F', 28, '2020-06-25', 'Export Officer', 4, 8, 70000);
🔍 Query Examples
🎯 1. Distinct Values
sql
Copy code
SELECT DISTINCT salary FROM employees;
🏷️ 2. Using Aliases
sql
Copy code
SELECT age AS Employee_Age, salary AS Employee_Salary FROM employees;
🔎 3. WHERE Clause and Operators
sql
Copy code
SELECT employee_name, hire_date, salary 
FROM employees
WHERE salary > 50000 AND hire_date < '2016-01-01';
🛠️ 4. UPDATE with Condition
sql
Copy code
SET SQL_SAFE_UPDATES = 0;
UPDATE employees
SET designation = 'Data Scientist'
WHERE designation IS NULL OR designation = ' ';
📊 5. ORDER BY Clause
sql
Copy code
SELECT * FROM employees 
ORDER BY department_id ASC, salary DESC;
📆 6. LIMIT with Filter
sql
Copy code
SELECT * FROM employees
WHERE YEAR(hire_date) = 2018
ORDER BY hire_date ASC
LIMIT 5;
📈 Aggregate Functions
sql
Copy code
SELECT SUM(salary) AS FINANCE_department_total_SALARY 
FROM employees 
WHERE department_id = 3;

SELECT MIN(age) AS Minimum_Age 
FROM employees;
🧮 GROUP BY Clause
sql
Copy code
SELECT location_id, MAX(salary)
FROM employees
GROUP BY location_id;

SELECT designation, AVG(salary) AS Avg_Salary
FROM employees
WHERE designation = 'Analyst'
GROUP BY designation;
⚙️ HAVING Clause
sql
Copy code
SELECT department_id, COUNT(*) AS employee_Count 
FROM employees
GROUP BY department_id
HAVING employee_Count < 3;

SELECT location_id, Gender, AVG(age) AS Average_Age
FROM employees
WHERE Gender = 'F'
GROUP BY location_id
HAVING Average_Age < 30;
🔗 SQL Joins
1. INNER JOIN
sql
Copy code
SELECT e.employee_name, e.designation, d.department_name
FROM employees AS e
INNER JOIN departments AS d 
ON e.department_id = d.department_id;
2. LEFT JOIN
sql
Copy code
SELECT d.department_name, COUNT(e.employee_id) AS total_employees
FROM departments AS d
LEFT JOIN employees AS e 
ON d.department_id = e.department_id
GROUP BY d.department_id;
3. RIGHT JOIN
sql
Copy code
SELECT e.employee_name, l.location
FROM employees AS e
RIGHT JOIN location AS l 
ON e.location_id = l.location_id;
🧠 Key Concepts Covered
✅ Database and table creation
✅ Primary and foreign keys
✅ Data insertion and retrieval
✅ Filtering with WHERE
✅ Updating records
✅ Sorting and limiting results
✅ Aggregate functions (SUM, MIN, AVG, etc.)
✅ Grouping and filtering with GROUP BY and HAVING
✅ INNER, LEFT, and RIGHT joins

🏁 Author
DEEPA M
📧 deepahari7@gmail.com
💼 MySQL Assignment 2 – Querying Data (Employee Database Project)

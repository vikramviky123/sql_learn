-- SQL SELECT, WHERE AND OTHER COMMANDS
-- 
--
USE hr_emp;
SHOW TABLES;
--
DESCRIBE hr_emp.employees;
--
-- --------Use of SELECT-------------------
SELECT *
FROM hr_emp.employees;
--
-- --------Use of NULL-------------------
SELECT *
from hr_emp.employees
WHERE commission_pct is NOT NULL;
-- --------Use of alias-------------------
SELECT first_name as fname,
    last_name as lname,
    salary
from hr_emp.employees;
-- --------Use of AND OR NOT-------------------
SELECT first_name last_name
FROM hr_emp.employees
WHERE salary < 15000
    OR salary > 30000;
--
SELECT first_name,
    last_name,
    salary
FROM hr_emp.employees
WHERE salary < 25000
    AND first_name LIKE "A%";
--
-- --------Use of OREDER BY & LIMIT-------------------
SELECT first_name,
    last_name,
    salary,
    salary * 0.05 as increment,
    (salary + salary * 0.05) as final_salary
FROM hr_emp.employees
WHERE salary <> 8000
    AND first_name LIKE "A%"
ORDER BY salary DESC
LIMIT 10;
--
SELECT department_id as dept,
    min(salary) as min_salary
FROM hr_emp.employees
WHERE first_name LIKE "A%"
GROUP BY department_id
HAVING min_salary > 15000;
--
SELECT first_name,
    last_name,
    salary
FROM hr_emp.employees
WHERE salary BETWEEN 20000 AND 30000;
-- --------Use of MATH FUNCTIONS-------------------
--
SELECT min(salary) as min_sal,
    max(salary) as max_salary,
    avg(salary) as avg_salary,
    sum(salary) as sum_salary,
    count(salary) as total_count
FROM hr_emp.employees;
-- --------Use of DISTINCT-------------------
SELECT DISTINCT department_id
FROM hr_emp.employees;
-- --------Use of VIEW-------------------
CREATE VIEW hr_emp.employee_low_salary as
SELECT first_name,
    last_name,
    salary
FROM hr_emp.employees
WHERE salary < 8000
ORDER BY salary DESC;
--
SELECT *
FROM hr_emp.employee_low_salary;
DROP VIEW hr_emp.employee_low_salary;
-- --------------------------------------------------------
--
SELECT *
FROM hr_emp.employees
LIMIT 10;
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
-- --------Use of WHERE-------------------
SELECT *
from hr_emp.employees
WHERE employee_id = 1;
SELECT *
from hr_emp.employees
WHERE employee_id in (10, 15);
-- --------Use of WHERE and LIKE-------------------
-- starts with V
SELECT *
from hr_emp.employees
WHERE first_name LIKE "V%";
-- ends with d
SELECT *
from hr_emp.employees
WHERE first_name LIKE "%d";
-- Does not ends with d and i
SELECT *
from hr_emp.employees
WHERE first_name NOT LIKE "%d"
    AND first_name NOT LIKE "%i";
-- last but one a
SELECT *
from hr_emp.employees
WHERE first_name LIKE "%a_";
-- first but one a
SELECT *
from hr_emp.employees
WHERE first_name LIKE "_a%";
-- first V and followed by four letters
SELECT *
from hr_emp.employees
WHERE first_name LIKE "V____";
--
-- This casts the string '123' to an integer
SELECT '123'::int;
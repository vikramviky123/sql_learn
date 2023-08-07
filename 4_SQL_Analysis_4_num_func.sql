-- SQL FUNCTIONS
-- 
--
USE hr_emp;
SHOW TABLES;
--
DESCRIBE hr_emp.employees;
--
-- --------Use of NUMERICAL FUNCTIONS-------------------
SELECT abs(-50) AS absolute_values
FROM dual;
--
SELECT 10 + 5;
SELECT 10 -5;
SELECT 10 * 5;
SELECT 10 / 5;
SELECT 10 %5;
SELECT 10 < 5;
SELECT 10 > 5;
SELECT 10 DIV 5;
SELECT 10 MOD 3;
--
SELECT count(salary) as total_count,
    avg(salary) as avg_salary,
    sum(salary) as sum_salary
FROM hr_emp.employees;
--
SELECT sign(-10.25);
SELECT POW(100, 0.5);
SELECT sqrt(100);
SELECT exp(3);
SELECT ln(3);
SELECT log(3);
--
SELECT ceil(3.8);
SELECT floor(3.8);
SELECT round(3.853489, 2);
SELECT truncate(3.853489, 3);
--
SELECT least(2, 3, 4, 5, 6, 87, 9);
SELECT greatest(2, 3, 4, 5, 6, 87, 9);
--
SELECT salary / 10000,
    (salary / 10000),
    POW(salary / 10000, (salary / 10000))
FROM hr_emp.employees;
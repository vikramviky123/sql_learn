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
SELECT 11 %100;
SELECT 10 < 5;
SELECT 10 > 5;
SELECT 11 DIV 5;
SELECT 11 MOD 3;
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
SELECT round(250500.5634, 0);
SELECT truncate(250500.5674, 3);
SELECT FORMAT(250500.5674, 3);
--
SELECT least(2, 3, 4, 5, 6, 87, 9);
SELECT greatest(2, 3, 4, 5, 6, 87, 9);
--
SELECT salary / 10000,
    (salary / 10000),
    POW(salary / 10000, (salary / 10000))
FROM hr_emp.employees;
--
SELECT std(salary) as std_salary,
    stddev(salary) as stdev_salary,
    stddev_pop(salary) as stdevpop_salary,
    stddev_samp(salary) as stdevsamp_salary
FROM hr_emp.employees;
SELECT var_pop(salary) as var_pop_salary,
    var_samp(salary) as var_samp_salary,
    variance(salary) as variance_salary
FROM hr_emp.employees;
--
SELECT DISTINCT manager_id
FROM hr_emp.employees;
--
SELECT manager_id,
    sum(salary) as manager_tot_pay
FROM hr_emp.employees
GROUP BY manager_id with rollup;
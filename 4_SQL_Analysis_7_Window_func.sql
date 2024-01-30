-- SQL FUNCTIONS
-- 
--
USE hr_emp;
SHOW TABLES;
--
DESCRIBE hr_emp.employees;
--
-- --------Use of WINDOW FUNCTIONS-------------------
SELECT manager_id,
    salary,
    SUM(salary) OVER (
        ORDER BY manager_id RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total,
    AVG(salary) OVER (
        ORDER BY manager_id RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_avg
FROM hr_emp.employees;
--
-- ROW_NUMBER,OVER and PARTITION-------------------------
SELECT manager_id,
    salary,
    row_number() OVER (
        ORDER BY manager_id
    ) as row_numba,
    sum(salary) OVER (
        ORDER BY manager_id
    ) AS ordr_sal_mngr_id,
    sum(salary) OVER (
        PARTITION BY manager_id
        ORDER BY manager_id
    ) prtn_sal_mngr_id,
    sum(salary) OVER () _sal_mngr_id,
    SUM(salary) OVER (
        ORDER BY manager_id RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS ordr_sal_mngr_id_rng_up_uf,
    SUM(salary) OVER (
        ORDER BY manager_id RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS ordr_sal_mngr_id_rng_up_cr,
    SUM(salary) OVER (
        PARTITION BY manager_id
        ORDER BY manager_id ROWS UNBOUNDED PRECEDING
    ) AS prtn_sal_mngr_id_rows_up,
    SUM(salary) OVER (
        ORDER BY manager_id ROWS UNBOUNDED PRECEDING
    ) AS ordr_sal_mngr_id_rows_up
FROM hr_emp.employees;
--
SELECT employee_id,
    salary,
    SUM(salary) OVER(
        ORDER BY employee_id
    ) AS ordrby_sum_sal,
    SUM(salary) OVER(
        ORDER BY employee_id RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS rng_up_cr_sum_sal,
    MAX(salary) OVER (
        ORDER BY employee_id RANGE BETWEEN 1 PRECEDING AND CURRENT ROW
    ) AS max_1_window,
    MAX(salary) OVER (
        ORDER BY employee_id RANGE BETWEEN 1 PRECEDING AND 1 FOLLOWING
    ) AS max_2_window,
    avg(salary) OVER (
        ORDER BY employee_id RANGE BETWEEN 1 PRECEDING AND 1 FOLLOWING
    ) AS mavg_2_window
FROM hr_emp.employees;
--
--ROW_NUMBER,OVER, CUME_DIST, PERCENT_RANK-------------------------
SELECT salary,
    ROW_NUMBER() OVER w AS 'row_number',
    CUME_DIST() OVER w AS 'cume_dist',
    PERCENT_RANK() OVER w AS 'percent_rank'
FROM hr_emp.employees WINDOW w AS (
        ORDER BY salary
    );
--
--
SELECT employee_id,
    first_name,
    last_name,
    manager_id,
    salary,
    row_number() OVER (
        PARTITION BY manager_id
        ORDER BY manager_id
    ) as row_numba,
    sum(salary) OVER (PARTITION BY manager_id) total_salary_man_id
FROM hr_emp.employees;
--
-- ROW_NUMBER, RANK, DENSE_RANK ---------------------------------------------
SELECT first_name,
    last_name,
    manager_id,
    salary,
    row_number() OVER (
        order by salary ASC
    ) as row_numbar,
    rank() OVER (
        order by salary ASC
    ) as rank_numbar,
    dense_rank() OVER (
        order by salary ASC
    ) as dense_numbar
FROM hr_emp.employees;
--
-- FIRST_VALUE, LAST_VALUE ---------------------------------------------
SELECT first_name,
    last_name,
    manager_id,
    salary,
    FIRST_VALUE(salary) OVER (
        order by salary DESC
    ) as fs_salary,
    LAST_VALUE(salary) OVER (
        order by salary DESC range between unbounded preceding and unbounded following
    ) as ls_salary
FROM hr_emp.employees
ORDER BY manager_id;
--
SELECT first_name,
    last_name,
    manager_id,
    salary,
    FIRST_VALUE(salary) OVER w as fs_salary,
    LAST_VALUE(salary) OVER w as ls_salary
FROM hr_emp.employees WINDOW w AS (
        ORDER BY salary range between unbounded preceding and unbounded following
    );
--
--
SELECT first_name,
    last_name,
    manager_id,
    salary,
    FIRST_VALUE(salary) OVER w AS 'first',
    LAST_VALUE(salary) OVER w AS 'last',
    NTH_VALUE(salary, 2) OVER w AS 'second',
    NTH_VALUE(salary, 4) OVER w AS 'fourth'
FROM hr_emp.employees WINDOW w AS (
        ORDER BY salary range between unbounded preceding and unbounded following
    );
--
--
-- LAG, LEAD ---------------------------------------------
SELECT first_name,
    last_name,
    manager_id,
    salary,
    LAG(salary) OVER w AS 'lag',
    LEAD(salary) OVER w AS 'lead',
    LAG(salary, 2) OVER w AS 'lag_2',
    LEAD(salary, 2) OVER w AS 'lead_2',
    NTILE(2) OVER w AS 'ntile_2'
FROM hr_emp.employees WINDOW w AS (
        ORDER BY salary
    );
--
-- VIEWS ---------------------------------------------
SELECT *
FROM hr_emp.employees;
--
CREATE VIEW hr_emp.emp_70 AS
SELECT employee_id,
    concat(first_name, ' ', last_name),
    salary
FROM hr_emp.employees
WHERE manager_id = 2;
--
SELECT *
FROM hr_emp.emp_70;
DROP VIEW hr_emp.emp_70;
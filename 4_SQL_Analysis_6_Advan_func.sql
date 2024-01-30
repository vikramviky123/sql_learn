-- SQL FUNCTIONS
-- 
--
USE hr_emp;
SHOW TABLES;
--
DESCRIBE hr_emp.employees;
--
-- --------Use of ADVANCED FUNCTIONS-------------------
SELECT BIN(15);
SELECT BINARY("My name is Vikram Reddy");
--
SELECT COALESCE(
        NULL,
        NULL,
        NULL,
        'W3Schools.com',
        NULL,
        'Example.com'
    )
FROM dual;
--
SELECT concat(first_name, " ", last_name),
    COALESCE(commission_pct, 300) AS adjusted_comm
FROM hr_emp.employees;
-- ----------------------------------------------------
-- CASE is used to create a column with if conditions
SELECT first_name,
    last_name,
    salary,
    CASE
        WHEN salary < 8000 THEN "The salary is < than 8000"
        WHEN salary < 20000 THEN "The salary is < 20000"
        ELSE "The quantity is > 20000"
    END as salary_condition
FROM hr_emp.employees;
--
SELECT first_name,
    last_name,
    salary,
    commission_pct
FROM hr_emp.employees
ORDER BY (
        CASE
            WHEN commission_pct IS NULL THEN salary
            ELSE commission_pct
        END
    );
-- IF CONDITION---------------------------------------
SELECT first_name,
    if(salary > 15000, "Highest Paid", "Lowest Paid") AS pay_concern
FROM hr_emp.employees;
-- IF NULL---------------------------------------
SELECT first_name,
    IFNULL(commission_pct, 300) AS comm_imputed
FROM hr_emp.employees;
-- IS NULL---------------------------------------
SELECT first_name,
    ISNULL(commission_pct) AS comm_imputed
FROM hr_emp.employees;
--
SELECT CONVERT(salary, nchar)
FROM hr_emp.employees;
-- -----------------------------------------------
SELECT CAST("2017-08-31" AS DATE);
SELECT CONVERT("2017-08-31", DATE);
SELECT CONVERT(2017, nchar);
SELECT CONCAT(2, '')
SELECT length(123)
from dual;
--
SELECT cast("2017" AS DECIMAL);
--
SELECT CONNECTION_ID();
--
SELECT CONV(15, 10, 2);
--
SELECT database();
--
SELECT IF("hello" = "hello", "YES", "NO");
--
SELECT CURRENT_USER() as curr_user,
    SESSION_USER() as sess_user,
    USER() as userr_,
    VERSION() as database_version
FROM dual;
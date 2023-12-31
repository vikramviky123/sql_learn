-- DML Commands
-- INSERT, UPDATE, DELETE, MERGE
--
--
CREATE DATABASE DML_database_2;
SHOW databases;
--
-- DROP TABLE DML_database_2.employees;
--
CREATE TABLE DML_database_2.employees(
    employee_id INT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    country VARCHAR(20),
    salary INT
);
-- -----------------------------------------
SHOW TABLES
FROM DML_database_2;
DESCRIBE DML_database_2.employees;
-- -------
-- -----------------INSERT------------------------
--
INSERT INTO DML_database_2.employees (
        employee_id,
        first_name,
        last_name,
        country,
        salary
    )
VALUES (1, "Vikram", "Reddy", "India", 100000),
    (2, "Manji", "Reddy", "USA", 150000),
    (3, "Jhansi", "Reddy", "Canada", 150000);
--
INSERT INTO DML_database_2.employees
VALUES (4, "ZZZ", "Reddy", "India", 200000),
    (5, "YYY", "Reddy", "USA", 350000),
    (6, "XXX", "Reddy", "Canada", 450000);
--
DESCRIBE DML_database_2.employees;
SELECT *
FROM DML_database_2.employees;
-- -----------------UPDATE------------------------
--
UPDATE DML_database_2.employees
SET first_name = "Jinna",
    last_name = "Bhai",
    salary = 500000
WHERE employee_id = 1;
SELECT *
FROM DML_database_2.employees;
-- -----------------DELETE------------------------
--
DELETE FROM DML_database_2.employees
WHERE first_name = "XXX";
SELECT *
FROM DML_database_2.employees;
-- -----------------COMMIT & ROLLBACK------------------------
--
SET autocommit = 0;
UPDATE DML_database_2.employees
SET first_name = "Vikram",
    last_name = "REDDY",
    salary = 100000
WHERE employee_id = 1;
COMMIT;
SELECT *
FROM DML_database_2.employees;
--
ROLLBACK;
SELECT *
FROM DML_database_2.employees;
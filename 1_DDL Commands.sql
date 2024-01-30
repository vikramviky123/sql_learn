-- DDL Commands
-- CREATE, ALTER, DROP, TRUNCATE, COMMENT, RENAME
-- ------------------CREATE-----------------------
-- CREATE a Database
CREATE DATABASE smapledatabase;
-- -----------------------------------------
-- CREATE Table
CREATE DATABASE DDL_database_1;
USE DDL_database_1;
CREATE TABLE customers(
    customer_id INT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    country VARCHAR(20)
);
-- -----------------------------------------
SHOW databases;
-- -----------------------------------------
SHOW TABLES
FROM DDL_database_1;
DESCRIBE DDL_database_1.customers;
-- -----------------------------------------
USE DDL_database_1;
SHOW TABLES;
DESCRIBE customers;
-- ---------
-- -----------------DROP------------------------
-- DROP a Database
DROP DATABASE DDL_database_1;
-- -----------------------------------------
-- DROP a table
DROP TABLE DDL_database_1.customers;
-- DROP TABLE DDL_database_1_py.customers;ode 
-- DROP TABLE DDL_database_1_py.employees;
-- ----------
-- -----------------ALTER------------------------
-- ALTER --CHANGE -- change column name and data type and constraint
ALTER TABLE DDL_database_1.customers CHANGE last_name second_name varchar(25);
DESCRIBE DDL_database_1.customers;
ALTER TABLE DDL_database_1.customers CHANGE second_name last_name varchar(20);
DESCRIBE DDL_database_1.customers;
-- ALTER --MODIFY --. change data type
ALTER TABLE DDL_database_1.customers
MODIFY first_name VARCHAR(20) UNIQUE NOT NULL;
DESCRIBE DDL_database_1.customers;
--
--
--  ALTER -- /DROP constraint column name only
ALTER TABLE DDL_database_1.customers DROP constraint first_name;
DESCRIBE DDL_database_1.customers;
--  ALTER -- /modify to change constraint
ALTER TABLE DDL_database_1.customers
MODIFY first_name VARCHAR(20) NULL;
DESCRIBE DDL_database_1.customers;
--
--
-- ALTER --ADD COLUMN --. column name and  data type is MUST
ALTER TABLE DDL_database_1.customers
ADD column salary INT;
DESCRIBE DDL_database_1.customers;
-- ALTER --  /DROP COLUMN --. remove column
ALTER TABLE DDL_database_1.customers DROP column salary;
DESCRIBE DDL_database_1.customers;
-- ALTER --ADD COLUMN AFTER --. column name and  data type is MUST
alter table DDL_database_1.customers
add date_of_birth date
after last_name;
DESCRIBE DDL_database_1.customers;
--
--
-- RENAME ------------------------------------------------------
RENAME TABLE DDL_database_1.customers TO DDL_database_1.customers_info;
DESCRIBE DDL_database_1.customers_info;
--
--
-- TRUNCATE ------------------------------------------------------
TRUNCATE TABLE DDL_database_1.customers_info;
DESCRIBE DDL_database_1.customers_info;
-- DROP ------------------------------------------------------
DROP TABLE DDL_database_1.customers_info;
USE DDL_database_1;
SHOW TABLES;
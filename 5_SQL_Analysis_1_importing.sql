CREATE DATABASE IF NOT EXISTS import_db;
-----------------------------------------------------
USE import_db;
CREATE TABLE import_db.data_import(
    Bank INT UNSIGNED NOT NULL,
    DD INT UNSIGNED,
    Withdrawals INT UNSIGNED,
    Deposits INT UNSIGNED,
    Branch_Area_in_sqft INT,
    avg_daily_walkins INT
);
SELECT *
FROM import_db.data_import;
--------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS salary_data_db;
-----------------------------------------------------
USE salary_data_db;
CREATE TABLE salary_data_db.salary_data(
    Age INT UNSIGNED,
    WorkClass varchar(30),
    FinalWeight INT UNSIGNED,
    Education varchar(20),
    Educational_Num INT UNSIGNED,
    Marital_Status varchar(30),
    Occupation varchar(30),
    Relationship varchar(30),
    Race varchar(30),
    Gender varchar(10),
    Capital_Gain INT UNSIGNED,
    Capital_Loss INT UNSIGNED,
    Hours_Per_Week INT UNSIGNED,
    Native_Country varchar(50),
    Income varchar(10)
);
SELECT *
FROM salary_data_db.salary_data
LIMIT 10;
- -
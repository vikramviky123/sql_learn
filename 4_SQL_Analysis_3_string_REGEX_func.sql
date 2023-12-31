-- SQL SELECT, WHERE AND OTHER COMMANDS
-- 
--
USE hr_emp;
SHOW TABLES;
--
DESCRIBE hr_emp.employees;
--
-- --------Use of STRING FUNCTIONS-------------------
select length ('Great Learning') as total_length
from dual;
select char_length ('Great Learning') as total_length
from dual;
SELECT concat("Vikram", "Reddy", "1988") as user_name
from dual;
--
SELECT *
FROM hr_emp.employees;
-- ----------------------------------------------------
SELECT first_name as fname,
    last_name as lname,
    concat(first_name, " ", last_name) as full_name,
    upper(concat(first_name, " ", last_name)) as full_name_caps,
    length(concat(first_name, "_", last_name)) as lenth
FROM hr_emp.employees;
-- 
-- ----------------------------------------------------
--CONCATING a position in string
SELECT concat(first_name, " ", last_name) as full_name,
    insert(concat(first_name, " ", last_name), 7, 3, "Bad")
FROM hr_emp.employees;
--
SELECT concat_ws(
        '---->',
        "my full name is :",
        concat(first_name, " ", last_name),
        salary
    ) as named_entity
FROM hr_emp.employees;
-- ----------------------------------------------------
--INSERT -->adding a string/number start pos and length of str/num
SELECT
insert("Vikram Reddy", 7, 4, 125) AS MatchPosition;
--REPLACE, REVERSE -->PERFORM operations on a STRING
SELECT REPLACE("Vikram Reddy", "R", "M") AS rplacePosition;
SELECT REVERSE("Vikram Reddy") AS reversePosition;
--
--FINDING INDEX of a STRING, for LOCATE 3rd para is start postion
SELECT INSTR("Vikram Reddy", "R") AS MatchPosition;
SELECT POSITION("R" IN "Vikram Reddy") AS justPosition;
SELECT LOCATE("3", "W3School3s3.com3", 1) AS positionWithOccur;
--MID, SUBSTR, SUBSTRING, SUBSTRING_INDEX -->extracting a string/number start pos and length of str/num
SELECT MID("Vikram Reddy", 8, 4) AS substrPosition;
SELECT SUBSTR("Vikram Reddy", 8, 4) AS substrPosition;
SELECT SUBSTRING("Vikram Reddy", 8, 4) AS substrPosition;
-- -- -- substring upto which character you want, the character occurence
SELECT SUBSTRING_INDEX("www.w3schools.chocom", "cho", 1),
    SUBSTRING_INDEX("www.w3schools.chocom", "cho", -1);
--
--
--TRIM, LTRIM, RTRIM -->Removing spaces
SELECT length(" Vikram Reddy     ") as act_len,
    TRIM(" Vikram Reddy     ") as fine_tuned,
    length(TRIM(" Vikram Reddy     ")) as fine_tuned_len
FROM dual;
--
SELECT LTRIM("    Janma") as ltrimmed,
    length(LTRIM("    Janma")) as ltrimmed_len,
    RTRIM("Janma               ") as rtrimmed,
    length(RTRIM("Janma               ")) as rtrimmed_len
FROM dual;
--
SELECT concat("Vikram reddy", space(15)) as newStr,
    length(concat("Vikram reddy", space(15))) as newStr_len
FROM dual;
--GROUP_CONCAT
SELECT manager_id,
    GROUP_CONCAT(
        first_name
        ORDER BY first_name ASC SEPARATOR ', '
    ) AS names,
    floor(sum(salary)) total_paid,
    floor(avg(salary)) avg_sal
FROM hr_emp.employees
GROUP BY manager_id
ORDER BY avg_sal DESC;
--
-- ELT to get the value for given position
SELECT ELT(1, 'Aa', 'Bb', 'Cc', 'Dd');
-- FIELD to get the position for given value
SELECT FIELD('Bb', 'Aa', 'Bb', 'Cc', 'Dd', 'Ff');
SELECT FIND_IN_SET("q", "s,q,l");
SELECT FORMAT(250500.5634, 3);
--
-- REGEX----------------------------------------------------------
-- REGEXP --> CHECKS if present or not--BOOLEAN
SELECT 'Michael!' REGEXP '.*';
SELECT 'xyxms' REGEXP '^[a-e]';
-- REGEXP_LIKE(input_string, pattern [, match_option])
-- CHECKS if pattern present or not of spcified string
SELECT REGEXP_LIKE('dog cat mouse pink red blue', 'mouse', 'i');
-- REGEXP_INSTR(input_string, pattern [, start_position [, occurrence [, match_option [, return_option]]]])
-- gets the POSITION of spcified string
SELECT REGEXP_INSTR('dog aaa cat aaa dog aaa', 'a{3}', 1, 3, 'c');
SELECT REGEXP_INSTR('aa aaa aaaa', 'a{4}');
-- REGEXP_REPLACE(input_string, pattern, replacement [, start_position [, occurrence [, match_option]]])
-- REPLACE the string at occurence provided
SELECT REGEXP_REPLACE(
        'dog  cat DOG aaa DOG',
        'DOG',
        'kukka',
        1,
        0,
        'c'
    );
-- REGEXP_SUBSTR(input_string, pattern [, start_position [, occurrence [, match_option [, return_option]]]])
SELECT REGEXP_SUBSTR('abc def ghi', '[a-z]+');
SELECT REGEXP_SUBSTR('abc def ghi', '[a-z]+', 1, 2);
SELECT REGEXP_SUBSTR(
        "vikram_viky2001@yahoo.com",
        '^[A-Za-z0-9._%+-]+'
    )
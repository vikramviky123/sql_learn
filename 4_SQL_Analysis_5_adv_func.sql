-- SQL FUNCTIONS
-- 
--
USE hr_emp;
SHOW TABLES;
--
DESCRIBE hr_emp.employees;
--
-- --------Use of DATE FUNCTIONS-------------------
SELECT date("2017-06-15") as date_,
    adddate("2017-06-15", interval 10 day) as date_interval,
    addtime("2017-06-15 09:51:20", "3 03:04:3") as time_interval
FROM dual;
-- USE of DAY
SELECT date_format("2017-06-15", "%D") AS Day_suffix_D,
    date_format("2017-06-05", "%d") AS Day_num_d,
    date_format("2017-06-05", "%e") AS Day_num_e
from dual;
--USE of WEEK DAY
SELECT date_format("2017-06-15", "%w") as weekDay_num_w,
    date_format("2017-06-15", "%W") as weekDay_name_W,
    date_format("2017-06-15", "%a") as short_weekDay_name_a
from dual;
--USE of MONTH
SELECT date_format("2017-06-15", "%b") as month_shortname_b,
    date_format("2017-06-15", "%M") as month_fullname_M,
    date_format("2017-06-15", "%c") as month_shortnumber_c,
    date_format("2017-06-15", "%m") as month_shortnumber_m
from dual;
--USE of YEAR
SELECT date_format("2017-06-15", "%Y") as full_year_Y,
    date_format("2017-06-15", "%y") as short_year_y
from dual;
--
SELECT datediff("2023-06-15", "2017-06-15");
-- --------Use of TIME FUNCTIONS-------------------
--
SELECT curdate() + 1;
SELECT current_date() + 1;
SELECT current_time();
SELECT current_timestamp();
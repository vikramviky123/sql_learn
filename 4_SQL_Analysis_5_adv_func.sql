-- SQL FUNCTIONS
-- 
--
USE hr_emp;
SHOW TABLES;
--
DESCRIBE hr_emp.employees;
--
-- --------Use of DATE FUNCTIONS-------------------
--
SELECT now();
--
SELECT date("2017-06-15") as date_,
    adddate("2017-06-15", interval 10 day) as add_days,
    date_add("2017-06-15", interval 10 day) as days_add,
    date_sub("2017-06-15", interval 10 day) as days_substract,
    subdate("2017-06-15", interval 10 day) as days_substract_,
    addtime("2017-06-15 09:51:20", "3 03:04:3") as time_interval
FROM dual;
--
SELECT datediff("2023-06-07", "2023-06-14");
SELECT datediff("2023-06-07", now());
--
SELECT dayofweek("2023-07-25") AS get_weekDay,
    day("2023-07-25") AS get_dayInMonth,
    dayofmonth("2023-07-25") AS get_dayOfMonth,
    dayofyear("2023-07-25") AS dayInYear,
    month("2023-07-25") AS get_monthNumber,
    monthname("2023-07-25") AS get_monthName,
    weekday("2023-07-25") + 1 AS get_NumOfWeekDay,
    dayname("2023-07-25") AS get_NameOfWeekDay,
    week("2023-07-25") AS get_weeknumInYear,
    weekofyear("2023-07-25") AS get_weeknumYear,
    quarter("2023-07-25") AS get_Quarter,
    YEAR("2023-07-25") AS get_Year,
    yearweek("2023-07-25") AS get_yearWeek
FROM dual;
--
SELECT hour("2017-06-15 09:51:20") AS get_hour,
    minute("2017-06-15 09:51:20") AS get_minute,
    second("2017-06-15 09:51:20") AS get_second,
    TIME("2017-06-15 09:51:20") AS get_only_time,
    TIMESTAMP("2017-06-15 09:51:20") AS get_timestamp,
    TIMEDIFF("09:51:20", "8:51:20") AS get_time_difference,
    TIME_TO_SEC("2017-06-15 00:51:20") AS get_time_to_sec,
    SEC_TO_TIME(3080) AS get_sec_to_time
FROM dual;
--
SELECT makedate(2018, 360) as create_date,
    maketime(09, 51, 20) as create_time,
    last_day("2017-06-20") as create_LastDay
FROM dual;
-- -----------------------------------------------------------------------------------------------
-- ---------- DATE FORMAT
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
-- Date format is used for date values and string
-- but STR_TO_DATEis only for dates as sting
SELECT date_format(hire_date, "%d/%m/%Y") as act_date,
    (date_format(hire_date, "%w") + 1) as weekDay,
    date_format(hire_date, "%d") as dayNum,
    date_format(hire_date, "%m") as MonthNum,
    date_format(hire_date, "%Y") as yearNum,
    date_format(hire_date, "%v") as weekNum,
    date_format(hire_date, "%W") as weekDayName,
    date_format(hire_date, "%M") as monthName
FROM hr_emp.employees;
--
SELECT STR_TO_DATE(hire_date, "%d/%m/%Y") as act_date,
    (STR_TO_DATE(hire_date, "%w") + 1) as weekDay,
    STR_TO_DATE(hire_date, "%d") as dayNum,
    STR_TO_DATE(hire_date, "%m") as MonthNum,
    STR_TO_DATE(hire_date, "%Y") as yearNum,
    STR_TO_DATE(hire_date, "%v") as weekNum,
    STR_TO_DATE(hire_date, "%W") as weekDayName,
    STR_TO_DATE(hire_date, "%M") as monthName
FROM hr_emp.employees;
--
SELECT STR_TO_DATE("2017-06-15", "%d/%m/%Y") as act_date,
    STR_TO_DATE("2017-06-15", "%d") as dayNum,
    STR_TO_DATE("2017-06-15", "%m") as MonthNum,
    STR_TO_DATE("2017-06-15", "%Y") as yearNum,
    STR_TO_DATE("2017-06-15", "%v") as weekNum,
    STR_TO_DATE("2017-06-15", "%W") as weekDayName,
    STR_TO_DATE("2017-06-15", "%M") as monthName
FROM dual;
-- -----------------------------------------------------------------------------------------------
-- --------Use of CURRENT TIME FUNCTIONS-------------------
SELECT now();
SELECT curdate() + 1;
SELECT current_date() + 1;
SELECT makedate(2017, 70);
-- ---------
SELECT current_time();
SELECT curtime();
SELECT localtime();
SELECT localtimestamp();
SELECT current_timestamp();
SELECT date("2017-06-15") as date_fromNow;
--
--Thu Jun 16 1977 00:00:00 GMT+0530 (India Standard Time)
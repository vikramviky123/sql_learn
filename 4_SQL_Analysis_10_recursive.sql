WITH RECURSIVE numbers AS(
    SELECT 1 AS n
    UNION
    SELECT n + 1
    FROM numbers
    WHERE n < 10
)
SELECT *
FROM numbers;
--------------------------------------
WITH RECURSIVE numbers (n) AS(
    SELECT 1
    UNION
    SELECT n + 1
    FROM numbers
    WHERE n < 10
)
SELECT *
FROM numbers;
--------------------------------------
WITH RECURSIVE cte AS (
    SELECT 1 AS n,
        CAST('abc' AS CHAR(20)) AS str
    UNION ALL
    SELECT n + 1,
        CONCAT(str, str)
    FROM cte
    WHERE n < 3
)
SELECT *
FROM cte;
--------------------------------------
WITH RECURSIVE fibonacci (n, fib_n, next_fib_n) AS (
    SELECT 1,
        0,
        1
    UNION ALL
    SELECT n + 1,
        next_fib_n,
        fib_n + next_fib_n
    FROM fibonacci
    WHERE n < 10
)
SELECT *
FROM fibonacci;
--
--
select repeat("*", 5);
--
WITH RECURSIVE cte AS (
    SELECT 1 AS n,
        CAST("*" AS CHAR(200)) AS str
    UNION ALL
    SELECT n + 1,
        CONCAT(str, " *")
    FROM cte
    WHERE n < 20
)
SELECT str
FROM cte
order by str desc;
--
WITH RECURSIVE Pattern AS (
    SELECT REPEAT('* ', 20) AS RowPattern,
        1 AS RowNumber
    UNION ALL
    SELECT SUBSTRING(RowPattern, 1, LENGTH(RowPattern) - 2),
        RowNumber + 1
    FROM Pattern
    WHERE RowNumber < 20
)
SELECT RowPattern
FROM Pattern;
--
with RECURSIVE cte as (
    SELECT 1 as n,
        CAST("*" as char(300)) as str
    UNION ALL
    select n + 1,
        CONCAT(str, "*")
    FROM cte
    WHERE n < 5
)
select *
from cte;
SELECT char(90);
select "vikram" as str;
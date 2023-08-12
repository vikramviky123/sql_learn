with cte_table AS (
    SELECT employee_id,
        concat(first_name, ' ', last_name),
        salary
    FROM hr_emp.employees
    WHERE salary < 10000
    ORDER BY employee_id
)
SELECT *
from cte_table;
--
--Findind MEDIAN VALUE DIFFERENT WAYS
with cte_table AS(
    SELECT employee_id,
        salary,
        cast(
            ROW_NUMBER() OVER(
                ORDER BY salary ASC
            ) AS DECIMAL
        ) as numba_asc,
        (
            (count(salary) OVER()) - (
                ROW_NUMBER() OVER (
                    ORDER BY salary ASC
                )
            )
        ) + 1 AS numba_dsc
    FROM hr_emp.employees
)
SELECT avg(salary) as Median_Value
FROM cte_table
WHERE abs(numba_dsc - numba_asc) < 2;
--
--
SELECT avg(salary) as medianValue
FROM (
        SELECT salary,
            ROW_NUMBER() OVER (
                ORDER BY salary
            ) AS row_num,
            COUNT(*) OVER () AS total_rows
        FROM hr_emp.employees
    ) AS RankedData
WHERE row_num = (total_rows + 1) / 2
    OR row_num in (total_rows / 2,(total_rows / 2) + 1);
-- ----------------------------------------------------------------------------
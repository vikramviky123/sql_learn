-- INNER JOIN--------------------------------------------
SELECT e.employee_id,
    e.first_name,
    e.last_name,
    e.employee_id,
    e.department_id,
    d.department_name,
    ROW_NUMBER() OVER(
        ORDER BY d.department_id
    ) as row_numb
FROM hr_emp.employees AS e
    INNER JOIN hr_emp.departments AS d ON e.department_id = d.department_id
ORDER BY d.department_id;
--
----------------------------------
SELECT e.employee_id,
    e.first_name,
    e.last_name,
    e.employee_id,
    e.department_id,
    d.department_name,
    ROW_NUMBER() OVER(
        ORDER BY d.department_id
    ) as row_numb
FROM hr_emp.employees AS e
    JOIN hr_emp.departments AS d ON e.department_id = d.department_id
ORDER BY d.department_id;
-- MULTIPLE INNER JOIN--------------------------------------------
SELECT e.employee_id,
    concat(e.first_name, ' ', e.last_name),
    d.department_name,
    l.city,
    l.state_province
FROM hr_emp.employees e
    INNER JOIN hr_emp.departments d ON e.department_id = d.department_id
    INNER JOIN hr_emp.locations l ON l.location_id = d.location_id
WHERE l.state_province IS NOT NULL
ORDER BY e.employee_id;
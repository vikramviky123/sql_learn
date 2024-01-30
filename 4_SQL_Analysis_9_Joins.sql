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
ORDER BY row_numb DESC;
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
--
SELECT *
FROM hr_emp.employees;
SELECT *
FROM hr_emp.departments;
SELECT *
FROM hr_emp.locations;
--
-- LEFT JOIN--------------------------------------------
SELECT e.employee_id,
    e.department_id,
    d.department_name,
    e.salary
FROM hr_emp.departments AS d
    LEFT OUTER JOIN hr_emp.employees AS e ON e.department_id = d.department_id;
--
SELECT e.employee_id,
    e.department_id,
    d.department_name,
    e.salary
FROM hr_emp.employees AS e
    LEFT OUTER JOIN hr_emp.departments AS d ON e.department_id = d.department_id;
-- RIGHT JOIN--------------------------------------------
SELECT e.employee_id,
    e.department_id,
    d.department_name,
    e.salary
FROM hr_emp.departments AS d
    RIGHT OUTER JOIN hr_emp.employees AS e ON e.department_id = d.department_id;
-- FULL OUTER JOIN--------------------------------------------
SELECT e.employee_id,
    e.department_id,
    d.department_name,
    e.salary
FROM hr_emp.departments AS d
    LEFT OUTER JOIN hr_emp.employees AS e ON e.department_id = d.department_id
UNION
SELECT e.employee_id,
    e.department_id,
    d.department_name,
    e.salary
FROM hr_emp.departments AS d
    RIGHT OUTER JOIN hr_emp.employees AS e ON e.department_id = d.department_id
ORDER BY employee_id;
--
-- SELF JOIN--------------------------------------------
SELECT e.employee_id,
    e.manager_id,
    e.first_name,
    m.employee_id AS mngr_emp_id,
    m.first_name as manager_firstName
FROM hr_emp.employees AS e
    INNER JOIN hr_emp.employees AS m ON e.manager_id = m.employee_id
ORDER BY e.manager_id;
--
SELECT *
FROM hr_emp.employees;
--
-- CROSS JOIN--------------------------------------------
SELECT d.department_id,
    d.department_name,
    d.manager_id,
    l.location_id,
    l.state_province,
    l.city
FROM hr_emp.departments AS d
    CROSS JOIN hr_emp.locations AS l
ORDER BY location_id,
    department_id;
-- -------------------------------------------
SELECT d.department_id,
    d.department_name,
    d.manager_id,
    l.location_id,
    l.state_province,
    l.city
FROM hr_emp.departments AS d,
    hr_emp.locations AS l
ORDER BY location_id,
    department_id;
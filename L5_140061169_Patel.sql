-- Name: Nirav Patel
-- Student id: 140061169
-- Date: Oct 4, 2018

-- Task 1 Display department name, city, adress, and postal code from table department and locations
SELECT d.department_name, l.city, l.street_address, l.postal_code 
FROM departments d INNER JOIN locations l
ON d.location_id = l.location_id
ORDER BY city, department_name;
-- SOLUITON used inner join and on to display the information on two differnt tables.

-- Task 2 Display, full name, hiredate, salary, deparment name, city from table employee and departments
SELECT last_name || ' ' || first_name as "Full Name" , hire_date,  salary,  department_name,  city
FROM employees e INNER JOIN departments d USING(department_id)
INNER JOIN locations l USING(location_id)
WHERE UPPER(department_name) LIKE 'A%' OR UPPER(department_name) LIKE 'S%'
ORDER BY d.department_name, "Full Name";
-- SOLUITON Used inner locations, employees and department to find the info and used where statement for the condition

-- Task 3 Display manager info, from employees table
SELECT last_name || ' ' || first_name as "Manager Full Name", department_name, city, postal_code, state_province
FROM employees e INNER JOIN departments d USING(manager_id)
INNER JOIN locations l USING(location_id)
WHERE lower(l.state_province) IN ('ontario', 'california', 'washington')
ORDER BY l.city, d.department_name;
 -- SOLUITON used inner join to join the tables where manger id equaled manager id from employees and only showed those.

 -- Task 4 Display employee name, emp#, manager name, and manager number
SELECT e.last_name AS "Employee Name" , e.employee_id AS "Emp #", m.last_name AS "Manager Name", m.employee_id AS "Mgr #"
FROM employees e LEFT JOIN employees m ON e.manager_id = m.manager_id;
-- SOLUITON used a left join on employees table where manager_id matched, using an alias and comparing the same table twice is how I did it. 

-- Task 5 Display department name, city, street adress, postal code, country and order by departments
SELECT d.department_name, l.city, l.street_address, l.postal_code, l.country_id
FROM departments d INNER JOIN locations l USING(location_id)
ORDER BY d.department_name DESC;
-- SOLUITON used inner join, USING location id and ordered by department name

-- Task 6 Show full name, hire date, salary and department name from differnt tables
SELECT e.first_name || ' / ' || e.last_name AS "Full Name", e.hire_date, e.salary, d.department_name
FROM employees e LEFT JOIN departments d ON(d.department_id = e.department_id)
WHERE UPPER(d.department_name) LIKE 'S%' OR UPPER(d.department_name) LIKE 'A%'
ORDER BY d.department_name, e.last_name;
-- SOLUITON displayed from differnt tables using LEFT join on employyes table and departments table, and used a where statement to meet the specifications

-- Task 7 Display and display last name, first name, department name, city, postal code, state province, with a specific where condition
SELECT e.last_name || ', ' || e.first_name, d.department_name, l.city, l.postal_code, l.state_province
FROM employees e INNER JOIN departments d ON(e.manager_id = d.manager_id)
INNER JOIN locations l ON(l.location_id = d.location_id)
WHERE lower(l.state_province) IN ('ontario', 'california', 'washington')
ORDER BY l.city, d.department_name;
-- SOLUITON used inner join where location_id matched between employees table, used a where statement to match condition and finnaly ordered by state province

-- Task 8 Display department name, min max and average salary of each department
SELECT d.department_name, TO_CHAR(max(e.salary), '$99,999,999') AS "Highest Salary", TO_CHAR(min(e.salary), '$99,999,999') AS "Lowest Salary", TO_CHAR(avg(e.salary), '$99,999,999') AS "Average Salary"
FROM employees e INNER JOIN departments d ON(d.department_id = e.department_id)
GROUP BY d.department_name
ORDER BY avg(e.salary) DESC;
-- SOLUITON Used inner join on employees table and department table, grouped by departments since that's what it was asking for

-- Task 9 Display employee name, emp#, manager name, and manager number
SELECT e.last_name AS "Employee" , e.employee_id AS "Emp#", m.last_name AS "Manager", m.employee_id AS "Mgr#"
FROM employees e FULL JOIN employees m USING(manager_id)
-- SOLUITON used a full join on employees table where manager_id matched, using an alias and comparing the same table twice is how I did it. 

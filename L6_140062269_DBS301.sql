-- Name: Nirav Patel
-- Student ID: 140061169
-- Date: Oct 6, 2018

-- Task 1 Set the autocommit on to ensure update, delete and inserts happen auto
SET AUTOCOMMIT ON;

-- Task 2 Insert Myself into the tbles
INSERT INTO employees(employee_id, first_name, last_name, salary, commission_pct, department_id, manager_id, hire_date, email, job_id)
VALUES (112 ,'Nirav', 'Patel', NULL, 0.2, 90, 100, sysdate, 'Nirav@gmail.com', 113);

-- Task 3 Create and update salary of 2 people
UPDATE employees
SET salary = 2500
WHERE UPPER(last_name) = 'MATOS' OR UPPER(last_name) = 'WHALEN';
--SOLUTION Used a Where statement where the last_name matched

-- Task 4 Display Last names of people who are in the same department as Abel
SELECT last_name
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM employees
    WHERE lower(last_name) = 'abel'); 
--Solution inner query to find the last name who matched the same department as abel

-- Task 5 Display last name of lowest paid employee
SELECT last_name as "Last Name"
FROM employees
WHERE salary = (
    SELECT min(salary)
    FROM employees
    );
--Solution innerquery to find the last name and displayed it

-- Task 6 Display the city of the lowest paid employee
SELECT l.city as "Cities with Lowest Employees"
FROM employees e INNER JOIN departments d USING(department_id) INNER JOIN locations l USING(location_id)
WHERE salary = (
    SELECT min(salary)
    FROM employees
    );
--Solution Inner queried to find the lowest salary

-- Task 7 Display last name, department id and salary for lowest paid employee per city
SELECT last_name, department_id, salary
FROM employees e
WHERE salary = (
    SELECT MIN(salary)
    FROM employees emp
    WHERE emp.department_id = e.department_id)
ORDER BY department_id; 
--Solution innerqueried to find the salary of lowest paid per city and ordered by department

-- Task 8 Display last name for lowest paid in each city
SELECT DISTINCT last_name, l.city
FROM employees e INNER JOIN departments d ON(e.department_id = d.department_id) INNER JOIN locations l ON (l.location_id = d.location_id)
WHERE salary IN (
    SELECT min(salary)
    FROM employees emp INNER JOIN departments dep ON(emp.department_id = dep.department_id) INNER JOIN locations loc ON(loc.location_id = dep.location_id)
    WHERE d.location_id = dep.location_id);
--SOLUTION  Inner query and join's to find all salary of each person in city and checked if all my employees made less than that
    
-- Task 9 Display last name and salary of everyone who learn less the lowest paid in each city
SELECT last_name, salary
FROM employees e
WHERE salary IN(
    SELECT salary
    FROM employees e
    WHERE salary IN(
                    SELECT min(salary)
                    FROM employees emp
                    WHERE e.department_id = emp.department_id))
ORDER BY salary DESC, last_name;
--SOLUTION Sub-query to find the matching department and another where subquery to find everyone with the same salary

-- Task 10 Display last name, job title, salary of all employees who match IT department
SELECT last_name, job_id, salary
FROM employees
WHERE salary IN (
    SELECT salary
    FROM employees
    where salary IN (SELECT salary 
                    FROM employees 
                    WHERE UPPER(job_id) = 'IT_PROG'))
ORDER BY salary, last_name;
-- SOLUTION Simple subquery to find everyone in IT department, and another subquery to compare.



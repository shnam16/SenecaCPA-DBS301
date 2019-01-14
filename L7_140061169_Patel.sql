-- Name: Nirav Patel 
-- Student ID: 140061169
-- Date: Nov 3, 2018

-- Task 1 List all departments that match the job id ST_CLERK
SELECT department_id 
    FROM departments
    INTERSECT
SELECT department_id
    FROM employees
    WHERE upper(job_id) != 'ST_CLERK';
-- Solution: used intersect to match job_id and showed department_id where they matched

-- Task 2 list all countries that don't have a department id meaning no department is in that country
SELECT country_id, country_name
    FROM countries
    MINUS 
    SELECT c.country_id, c.country_name
    FROM countries c inner join locations l on(l.country_id = c.country_id) inner join departments d on(l.location_id = d.location_id)
    WHERE l.location_id = d.location_id; 
--SOLUTION: used minus to compare all locations to locations with departments 
            
-- Task 3 list jobid and department id 10, 50 and 20
SELECT job_id, department_id
    FROM (SELECT department_id, job_id
            FROM employees
            WHERE department_id = 10
            union 
            SELECT department_id, job_id
            from employees
            WHERE department_id = 50
            union
            SELECT department_id, job_id
            from employees
            WHERE department_id = 20) 
                      ORDER BY 
                            CASE WHEN department_id = 10 then 1 
                            WHEN department_id = 50 then 2 end;                      
--SOLUTION: used union for matching the department_id and case in my order by to make it ordered the correct way.

--Task 4 list employees who have the same job id in the job_history table
SELECT employee_id, job_id
FROM employees
    INTERSECT
    SELECT employee_id, job_id
    FROM job_history;
--SOLUTION: used intersect to compare employee_id and job_id to the job_history table

--Task 5 list lastname, department id for all employees and for all departments with or without employees for both
SELECT  last_name, department_id, TO_CHAR(NULL)
    FROM employees
    UNION ALL
    SELECT TO_CHAR(NULL), department_id, department_name
    FROM departments;
--SOLUTION: used a to_char field to make it print all the data and union all to make them overlap the data to print fields without employees as well



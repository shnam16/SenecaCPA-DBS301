
-- Task 1
SELECT employee_id, SUBSTR(last_name || ' ' || first_name, 0, 25) as "Full Name", 
job_id, TO_CHAR(LAST_DAY(hire_date), 'Month fmddth "of" yyyy') AS "Start Date"
FROM employees
WHERE TO_CHAR(TRUNC(hire_date, 'month'), 'month') = TO_CHAR(TRUNC(TO_DATE('05-11-2000', 'mm-dd-yyyy'), 'month'), 'month')
OR TO_CHAR(TRUNC(hire_date, 'month'), 'month') = TO_CHAR(TRUNC(TO_DATE('11-11-2000', 'mm-dd-yyyy'), 'month'), 'month')
AND (hire_date != TO_DATE('01-01-1994', 'mm-dd-yyyy') OR hire_date != TO_DATE('01-01-1995', 'mm-dd-yyyy'))
ORDER BY hire_date DESC;

-- Task 2
SELECT 'Emp# ' || employee_id || 
        ' named ' || first_name || ' ' || last_name || ' who is ' ||
        CASE job_id WHEN '%VP' THEN 1.3*salary
        ELSE 1.2*salary END
        || ' will have a new salary of $' || salary AS empInfo
    FROM employees
    WHERE salary NOT BETWEEN 6000 AND 11000
        AND (job_id LIKE '%VP' OR employee_id IN (SELECT manager_id FROM departments))
    ORDER BY salary DESC;
    
-- Task 3
SELECT 
    last_name AS "Last Name",
    job_id AS "Job",
    manager_id AS "Manager",
    TO_CHAR(salary,'$999,999.99') AS "Salary",
    TO_CHAR((salary * (1 + NVL(commission_pct,0)) * 12 + (12 * 1000)),'$999,999.99') AS "Total INcome"
FROM Employees
WHERE commission_pct IS NULL
OR (job_id LIKE 'SA%' AND (salary + 1000 + commission_pct*salary > 15000))
ORDER BY salary DESC;


-- Task 4
SELECT department_id || ', ' || job_id || ', ' || to_char(min(salary), '$999,999,999.00') AS "Dept/Job Pay"
FROM employees
GROUP BY department_id, job_id
    HAVING min(salary) > 6000 AND min(salary) < 18000 
      AND upper(job_id) NOT LIKE '%REP' 
      AND upper(job_id) NOT LIKE 'IT%' 
      AND upper(job_id) NOT LIKE 'SA%'
ORDER BY department_id, job_id;

-- Task 5 
SELECT 
    last_name AS "Last Name",
    TO_CHAR(salary,'$999,999.99')AS "Salary",
    job_id AS "Job ID"
FROM employees inner join departments USING(department_id) inner join locations USING(location_id)
WHERE salary > ANY(SELECT MAX(salary)
        FROM employees 
        where salary IN (SELECT MIN(salary) FROM employees e
            INNER JOIN departments d
                ON(e.department_id = d.department_id)
            INNER JOIN locations l
                ON(l.location_id  = d.location_id)
            WHERE UPPER(l.country_id) != 'US' 
            AND UPPER(e.job_id) != 'AD_PRES'
            AND UPPER(e.job_id) != 'AD_VP'
            
            GROUP BY e.department_id
            ))
    AND UPPER(job_id) != 'AD_PRES'
    AND UPPER(job_id) != 'AD_VP'
    AND UPPER(country_id) != 'US';

-- Task 6
SELECT last_name, salary, job_id, department_id
FROM employees
WHERE salary > ANY(SELECT min(salary)
                FROM employees
                WHERE UPPER(department_id) LIKE 'MK%')
AND job_id LIKE 'IT%' OR job_id LIKE 'MK%';
SELECT 
    last_name,
    TO_CHAR(salary,'$999,999.99') AS "Salary",
    job_id
FROM employees
WHERE department_id IN (SELECT department_id FROM departments
                        WHERE UPPER(department_name) IN ('IT','MARKETING'))
        AND salary > (SELECT MIN(salary)
                        FROM employees
                        WHERE department_id =(SELECT department_id
                                                FROM departments
                                                WHERE UPPER(department_name)='ACCOUNTING'
));
-- Task 7
SELECT substr((first_name || ' ' || last_name), 1, 25) AS "Employee", job_id, LPAD(to_char(salary, '$99,999'), 12, '=') 
AS "Salary", department_id AS "Dep#"
FROM employees
WHERE salary < (SELECT  max(salary)
                            FROM employees
                            WHERE upper(job_id) != 'AD_VP'
                            AND upper(job_id) != 'AD_PRES'
                            AND employee_id NOT IN (SELECT NVL(manager_id, 0)
                                                    FROM departments)
                            AND department_id IN (SELECT department_id 
                                                    FROM departments
                                                    WHERE upper(department_name) IN ('MARKETING', 'SALES')))
AND upper(job_id) != 'AD_PRES'
AND upper(job_id) != 'AD_VP'
AND department_id IN (SELECT department_id FROM departments WHERE upper(department_name) IN ('MARKETING', 'SALES'))
AND upper(job_id) NOT LIKE '%MAN';

-- Task 8
SELECT d.department_name,  SUBSTR(NVL(l.city, 'Not Assigned Yet'), 1, 25) AS "City", COUNT(DISTINCT job_id) AS "# of Jobs"
FROM employees e full join departments d 
    ON(e.department_id = d.department_id)
 left join locations l 
    ON(d.location_id = l.location_id)
GROUP BY d.department_name, l.city;
                  
                                               
        

    

                
               
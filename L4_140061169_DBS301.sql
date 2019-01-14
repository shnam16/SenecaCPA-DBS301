-- Name: Nirav Patel
-- Student id: 140061169
-- Date: Sep 27, 2018

-- Task 1 Display the difference in salary, average vs least

SELECT TO_CHAR(ROUND(AVG(salary) - MIN(salary), 2), '$999,999.99') AS "Average Salary"
FROM employees;

-- Solution simple select statement being used and to_char, round and avg to do the calculations.

-- Task 2 Display salary of highest, lowest and average

SELECT department_id, 
TO_CHAR(max(salary) , '$999,999') AS "High", 
TO_CHAR(min(salary), '$999,999') AS "Low",
TO_CHAR(ROUND(avg(salary),2), '$999,999.00') AS "Average"
FROM employees
GROUP BY department_id
ORDER BY "Average" DESC;  

-- Solution Displaying using group by to show salaries for each departments 

-- Task 3 Display how many people work the same job in the same dep, and display number of people

SELECT department_id AS "Dept#", job_id "Job", COUNT(job_id) AS "Number of People"
FROM employees
GROUP BY job_id, department_id
HAVING COUNT(job_id) > 1
ORDER BY "Number of People" DESC;

-- Solution Using groupby jobid and departmentid so it's sorted by it and using count jobid.

-- Task 4 Display job title and amount paid each monther, exclude vp and pres, salary less than 12000

SELECT job_id, TO_CHAR(salary, '$999,999.99') AS "salary"
FROM employees
GROUP BY job_id, salary
HAVING salary > 12000 AND job_id NOT IN ('AD_VP', 'AD_PRES');

-- Solution

-- Task 5 Display how many people a manager supervises

SELECT manager_id, count(employee_id)
FROM employees
GROUP BY manager_id
HAVING count(employee_id) > 2 AND manager_id NOT IN (100, 101, 102)
ORDER BY count(employee_id) DESC;

-- Solution Using Group by for managerid, and showing how many work under each using restrictions as specified

-- Task 6 Display department id and each showing there highest and lowest department dates

SELECT department_id, max(hire_date), min(hire_date)
FROM employees
GROUP BY department_id
HAVING department_id NOT IN (10, 20) AND (min(hire_date) < TO_DATE('01-01-2001', 'mm-dd-yyyy'))
ORDER BY max(hire_date) DESC; 

-- Solution Displaying Group BY department and again using having and where to meet the specifications
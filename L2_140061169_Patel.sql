-- ***********************
-- Name: Nirav Patel
-- ID: 140061169
-- Date: Sep 13, 2018
-- Purpose: Lab 2 DBS301
-- ***********************

--TASK 1-- Display Empid, lastname and salary in a given range and order it.
SELECT employee_id, last_name AS "Last Name", to_char(salary, '$999,999.99') AS salary
FROM employees
WHERE(salary >= 9000 AND salary <= 11000)
ORDER BY salary DESC, last_name;
--SOLUTION displying empid, lastname, and salary in a range of 9000-1100, ordered by salary then last name.

--TASK 2--Modify the previous query to only show speific jobs
SELECT employee_id, last_name AS "Last Name", to_char(salary, '$999,999.99') AS salary
FROM employees
WHERE job_id IN ('IT_PROG', 'SA_REP')
ORDER BY salary DESC, last_name;
--SOLUTION changed the where statement to show job id instead of salary as specified 

--TASK 3--Use the same range from question 1 instead combine the first 2 questions's WHERE condition
SELECT employee_id, last_name AS "Last Name", to_char(salary, '$999,999.99') AS salary
FROM employees
WHERE ((job_id = 'IT_PROG' OR job_id = 'SA_REP') AND (salary < 9000 OR salary > 11000)) 
ORDER BY salary DESC, last_name;
--SOLUTION Used the AND statement to combine the where statement

--TASK 4--Display people who where hired after a certain date
SELECT last_name, job_id, to_char(salary, '$999,999.99') AS salary
FROM employees
WHERE hire_date < to_date('1998/01/01', 'yyyy/mm/dd')
ORDER BY hire_date DESC;
--SOLUTION--Used a "to-date" function to use my hardcoded date to compare.

--TASK 5--Make a table to only show people that where hired before a certain date and with a salary condition
SELECT last_name, job_id, to_char(salary, '$999,999.99') AS salary
FROM employees
WHERE hire_date < to_date('1998/01/01', 'yyyy/mm/dd') AND salary > 10000
ORDER BY job_id, salary desc;
--SOLUTION used the same feature above with a addition to the salary condition

--TASK 6--Make a table to only show people with e or E in there firstname
SELECT job_id, first_name || ' ' || last_name as "Name"
FROM employees
WHERE first_name LIKE '%e%' OR first_name LIKE '%E%';

SELECT job_id, first_name || ' ' || last_name as "Name"
FROM employees
WHERE UPPER(first_name) LIKE '%E%';
--SOLUTION used LIKE and OR statement to find people with e or E in there first name.

--TASK 7-- make a table for lastname, salary, comssion
SELECT last_name, salary, commission_pct
FROM employees
Where commission_pct is not null; 
--SOLUTION simple display of a table lastname, salary, comssionpct

--Task 8--Order the table in number 7 in descending from salary
SELECT last_name, salary, commission_pct
FROM employees
Where commission_pct is not null
ORDER BY 2 DESC; 
--SOLUTION-- same as above but ordered in descending.

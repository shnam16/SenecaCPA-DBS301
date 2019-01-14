-- ************************
-- NAME: Nirav Patel
-- ID: 140061169
-- DATE: Sep 6, 2018
-- PURPOSE: Lab 1 DBS301
-- ************************

-- Question 1 - Use Select for Employees, Department, Jobhistory  and find the longest and widest table.

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM JOB_HISTORY;

-- SOLUTION - Employees table is the longest. Employees table is also the widest with the most colums.

-- Question 2 - Fixed the SELECT statement in the solution that did was incorrect.

SELECT last_name AS "LName", job_id AS "Job Title", 
       hire_date AS "Job Start"
       FROM EMPLOYEES;

-- SOLUTION - Missing Keyword "AS" for Alias and missing underscore between Hire and Date which caused errors and did not work as intended.

-- Question 3 - Fixed 3 Errors which were given and made the code work as intended

SELECT employee_id, last_name, commission_pct AS "Emp Comm"
FROM EMPLOYEES;

-- SOLUTION - Missing underscore between last and name, missing AS for Emp Comm alias and extra comma between FROM statement

-- Question 4 - Answering how to show the structure of the LOCATIONS table.

DESC LOCATIONS;

-- SOLUTION - Using the DESC function on the table LOCATIONS to show the structure of the table.


-- Question 5 - Querying the City#, City and Province with country code

SELECT location_id AS "CITY#", city AS "City", (state_province || ' IN THE ' || country_id) AS "Province with Country Code"
FROM LOCATIONS;

-- Solution, using select statement and concatinating with || to display it as shown.

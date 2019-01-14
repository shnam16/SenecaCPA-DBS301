-- Name: Nirav Patel
-- Student id: 140061169
-- Date: Sep 22, 2018

-- TASK 1: Write a query that shows tommrows date.
SELECT TO_CHAR(sysdate+1, 'Month mm"th of year "yyyy') AS "Tommrows Date"
FROM dual;
-- SOLUTION: used the to_char function, first parameter is the input, and second is how you want to display it.

-- TASK 2: Do some calculations to the salary and concatinating it, and using a where condition
SELECT last_name, first_name, salary, salary * 1.05 AS "Good Salary", salary*1.05 || ' - ' || salary || ' * ' || '12' || ' = ' || ((salary*1.05)-salary)*12 AS "Annual Pay Increase"
FROM employees
WHERE department_id IN (20, 50 ,60);
-- SOLUTION: Used || to concatinate and did the caculations in the select statement


-- TASK 3: Write first, and last name with specific condition
SELECT last_name || ', ' || first_name || ' is ' || job_id AS "Person and Job"
FROM employees
WHERE UPPER(last_name) LIKE '%S'AND UPPER(first_name) LIKE 'C%' OR UPPER(first_name) LIKE 'K%'
ORDER BY last_name;
-- SOLUTION: Used LIKE statements for all the conditions.

-- TASK 4: Write, lastname, and hire date for a sepcific year period, and order by the same condition. 
SELECT last_name, hire_date, EXTRACT(YEAR FROM sysdate) - EXTRACT(YEAR FROM hire_date) AS "Years worked"
FROM employees
WHERE hire_date < to_date('01-01-1992', 'mm-dd-yyyy')
ORDER BY EXTRACT(YEAR FROM sysdate) - EXTRACT(YEAR FROM hire_date) DESC;
-- SOLUTION: Used EXTRACT function to round, and sysdate to get current time.

-- TASK 5: Replace NuLL statement for province with unknown province and city check condition.
SELECT city, country_id, NVL(state_province, 'Unknown Province')
FROM locations
WHERE UPPER(city) LIKE 'S_______%';
-- SOLUTION: Used LIKE statement for the select condition, and a function called NVL that changs null char into unkown province.

-- TASK 6: Write a select statement that shows hiredate + 1 year from it to the nearest thursday
SELECT last_name, hire_date, TO_CHAR(NEXT_DAY(TO_DATE(ADD_MONTHS(hire_date, '12')), 'THURSDAY'), 'fmDay, Month "the" fmDdspth "of year "fmyyyy') AS "NEXT DAY"
FROM employees
WHERE hire_date > to_date('1997', 'yyyy')
ORDER BY (NEXT_DAY(TO_DATE(ADD_MONTHS(hire_date, '12')), 'THURSDAY'));
-- SOLUTION: used, TO CHAR for the display, NEXT_DAY to get the nearest thursday, and ADD_MONTHS to add 1 year to hiredate.




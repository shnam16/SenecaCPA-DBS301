-- Name: Nirav Patel 
-- Student ID: 140061169
-- Date: Nov 3, 2018

-- Task 1 show everyone who make more than the lowest salary
SELECT first_name, last_name
    FROM employees 
    WHERE salary > (SELECT min(salary)
                    FROM employees);
-- SOLUTION used a inner query to get and compare all lowest paying employee for each department

--Task 2 show everyone who makes the lowest than the lowest in eah department
SELECT first_name, last_name
    FROM employees e
    WHERE salary = (SELECT min(salary)
                    FROM employees
                    WHERE department_id =  e.department_id);
--SOLUTION used a inner query for each dpeartment to match where min salary were the same

-- Task 3 add 100 dollars to everyones salary 
SELECT first_name, last_name, salary+100 AS "Bonus"
    FROM employees e
    WHERE salary = (SELECT min(salary)
                    FROM employees
                    WHERE department_id =  e.department_id);
--SOLUTION used a inner query for each dpeartment to match where min salary were the same


-- Task 4 create a allemp view with employee data
CREATE VIEW ALLEMPS AS
    SELECT employee_id, last_name, salary, department_id, department_name, city, country_name
        FROM employees inner join departments using(department_id) inner join locations using(location_id)
            inner join countries using(country_id);
-- SOLUTION used the command create view and simple select statement for the data

-- Task 5 selet data from the allemps view we created
--A--
SELECT employee_id, last_name, salary, city FROM ALLEMPS;
--B--
SELECT sum(salary) FROM ALLEMPS GROUP BY city;
--C--
SELECT salary+100 AS "Salary Increased Amount"
    FROM ALLEMPS a
        WHERE salary = (SELECT min(salary)
                        FROM ALLEMPS b
                            WHERE a.department_id = b.department_id);
--D--
INSERT INTO ALLEMPS(employee_id, last_name, salary, department_id, department_name, city, country_name)
    VALUES(123, 'bob', 1000, 1, 'art', 'toronto', 'brazil');
--E--
--> ERROR WAS "SQL Error: ORA-01776: cannot modify more than one base table through a join view", it would work if we didn't inner join all the other tables
--F--
DELETE FROM ALLEMPS WHERE lower(first_name) = 'vargas';
--> Did not work, first_name is an invalid indentifer
--SOLUTION modified the data used the view as the table

-- Task 6 make a alldeps view that shows department info 
CREATE VIEW ALLDEPS AS
    SELECT department_id, department_name, city, country_name
    FROM departments inner join locations using(location_id) inner join countries using(country_id);
    
--SOLUTION used the create view command and select statement for the table view

-- Task 7 select department id, name and city from the view we created called alldeps
SELECT department_id, department_name, city
    FROM ALLDEPS;
--B--
SELECT COUNT(department_id)
    FROM ALLDEPS
    GROUP BY city;
--SOLUTION selecting data from the view alldeps

-- Task 8 create a view called appdeptsumm with the details provided: total emp, salaied, total salary
CREATE OR REPLACE VIEW alldeptsumm AS 
  SELECT d.department_id, d.department_name, count(e.employee_id) AS "Total" , count(c.employee_id) AS "Salaried", count(e.salary) AS "Total Salary"
    FROM employees e inner join departments d on e.department_id = d.department_id
        LEFT JOIN employees c ON e.employee_id=c.employee_id 
            AND c.commission_pct IS NULL
                GROUP BY d.department_id, d.department_name;
--SOLUTION used the create view command and select statement for the table view
-- Task 9 select all departments that have less employee than average
    SELECT department_name, "Total"
    FROM alldeptsumm
    WHERE "Total" > (SELECT avg("Total") FROM alldeptsumm);
--SOLUTION queried the view for the data matching

-- Task 10 -- use the grant and revote statements
GRANT SELECT ON employees TO dbs301_183g20;
GRANT SELECT, INSERT, UPDATE ON departments TO dbs301_183g20;

--Revoke
REVOKE INSERT, UPDATE, ON departments FROM dbs301_183g20;

SELECT * FROM USER_TAB_PRIVS;
--SOLUTION grand and revoke command were used as specified
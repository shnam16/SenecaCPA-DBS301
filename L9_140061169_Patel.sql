-- Name: Nirav Patel 
-- Student ID: 140061169
-- Date: Nov 18, 2018

-- Task 1 create a table using the employees table and add a where condition

CREATE TABLE SALESREP (RepId, FName, LName, Phone#, Salary, Commission) AS
    SELECT employee_id, first_name, last_name, phone_number, salary, commission_pct
    FROM employees
    WHERE department_id = 80;

-- SOLUTION used the create table and sub query to add the employees table data

-- Task 2 create a cust table with the details provided
CREATE TABLE Cust(
   CUST# NUMBER(6),
   CUSTNAME VARCHAR2(30) NOT NULL,
   CITY VARCHAR2(20) NOT NULL,
   RATING CHAR(1),
   COMMENTS	VARCHAR2(200),
   SALESREP# NUMBER(7)
);

INSERT INTO Cust (CUST#, CUSTNAME, CITY, RATING, SALESREP#)
    VALUES (501, 'ABC LTD.', 'Montreal', 'C', 201);
INSERT INTO Cust (CUST#, CUSTNAME, CITY, RATING, SALESREP#)
    VALUES (502, 'Black Giant.', 'Ottaa', 'B', 202);
 INSERT INTO Cust (CUST#, CUSTNAME, CITY, RATING, SALESREP#)
    VALUES (503, 'Mother Goose.', 'London', 'B', 202);
 INSERT INTO Cust (CUST#, CUSTNAME, CITY, RATING, SALESREP#)
    VALUES (701, 'BLUE SKY LTD.', 'Vancouver', 'B', 102);
 INSERT INTO Cust (CUST#, CUSTNAME, CITY, RATING, SALESREP#)
    VALUES (702, 'MIKE and SAM Inc.', 'Kingston', 'A', 107);
 INSERT INTO Cust (CUST#, CUSTNAME, CITY, RATING, SALESREP#)
    VALUES (703, 'RED PLANET', 'Mississauga', 'C', 107);
 INSERT INTO Cust (CUST#, CUSTNAME, CITY, RATING, SALESREP#)
    VALUES (717, 'BLUE SKY LTD', 'Regina', 'D', 102);
-- SOLUTION created the table and inserted into command for the data

-- Task 3 create a goodcust table with the details provided
CREATE TABLE GOODCUST (
    CustId NUMBER(6),
    PName VARCHAR2(30),
    PLocation VARCHAR2(20),
    RepId NUMBER(7));
    
INSERT INTO GOODCUST (custID, PName, PLocation, RepId)
   SELECT CUST#, CUSTNAME, CITY, SALESREP#
   FROM Cust
   WHERE RATING IN ('A', 'B');
-- SOLUTION created table and used insert into command followed with a select statement to match specific data

-- Task 4 alter the table to add jobcode
ALTER TABLE SALESREP
    ADD JOBCODE VARCHAR(12);
    
DESC SALESREP;
-- SOLUTION alter table command to add column

-- Task 5 alter the table to add salary un changeable
ALTER TABLE SALESREP
     modify SALARY INT NOT NULL;
     
ALTER TABLE GOODCUST 
     modify PLocation INT NULL;
-- SOLUTION alter table to modify salary and location 

-- Task 6  hide the jobcode coloum so it wont affect other data
ALTER TABLE SALESREP 
    SET UNUSED(JobCode);
-- SOLUTION alter table and set the coloum to not visible

-- Task 7 add a constraint primary key
ALTER TABLE SALESREP
    ADD CONSTRAINT custid_pk Primary Key(custid); 

ALTER TABLE GOODCUST 
    ADD CONSTRAINT repid_pk Primary Key (RepId); 
-- SOLUTION added constraint to add primary key for both tables

-- Task 8 add a constraint primary key
ALTER TABLE SALESREP
    ADD CONSTRAINT phone_uk UNIQUE (PHONE#); 

ALTER TABLE GOODCUST
    ADD CONSTRAINT name_uk UNIQUE (PNAME); 
-- SOLUTION added constraint command with unique key for the input

-- Task 9 add a constraint check salary between 6k and 12k
ALTER TABLE SALESREP
    ADD CONSTRAINT salary_check CHECK((salary BETWEEN 6000 AND 12000) AND commission < 0.5);
-- SOLUTION used constraint command and check to alter the table as specified

-- Task 10 add a constraint to make sure repid is valid
ALTER TABLE SALESREP
    ADD CONSTRAINT RepId_check CHECK(RepId IS NOT NULL);
-- SOLUTION contraint command and check

-- Task 11 update goodcust tble to set repid's to null
update goodcust set "REPID" = null;
-- worked
-- SOLUTION updated to set repid to not equal to null to make sure valid the data

-- Task 12 disable constraint goodcust forigen key
ALTER TABLE GOODCUST DISABLE CONSTRAINT GOODCUST_FK;
-- SOLUTION disabled the constraint goodcust primary key

-- Task 13 alter table to disable constraint and add a salary check constraint
ALTER TABLE GOODCUST DISABLE CONSTRAINT RepId_FK;

ALTER TABLE goodcust
    add constraint CHECK(salary BETWEEN 5000 AND 15000);
-- SOLUTION disabled constraint and added check between 5k and 15k

    
-- Task 14 check the structure of the 2 tables we created and run the given select statement
desc goodcust;
desc salesrep;

SELECT constraint_name, constraint_type, search_condition, table_name 
FROM user_constraints 
WHERE table_name IN (‘SALESREP’,’GOODCUST’)
ORDER BY 4 , 2;
-- SOLUTION desc command and copy pasted the given command


---ignore below for testing---
SELECT * FROM GOODCUST;

SELECT * FROM SALESREP;
---ignore above for testing---



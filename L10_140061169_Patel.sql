-- Name: Nirav Patel
-- Student id: 140061169
-- Date: Nov 25, 2018

-- Task 1 Create a city table from locations where location id is less than 2000
CREATE TABLE CITIES AS (
    SELECT location_id, street_address, postal_code, city, state_province, country_id
    FROM locations
    WHERE location_id < 2000);
--Solution: used the command create made the view with the specifications

-- Task 2 create a table towns from locations where locationid is less than 1500
CREATE TABLE TOWNS AS (
    SELECT location_id, street_address, postal_code, city, state_province, country_id
    FROM locations
    WHERE location_id < 1500);
--Solution: used the command create made the view with the specifications

--Task 3 clear recycling bin, drop a table and check the bin
PURGE RECYCLEBIN; -- REMOVE EVERYTHING FROM RECYCLE BIN
DROP TABLE TOWNS; -- REMOVE TABLE
SELECT * FROM RECYCLEBIN; -- CHECK BIN TO SEE IF ITS REMOVED
--Solution: purged the bin, droped the view and flshback command to bring the table back

--Task 4 flashback before drop and select the bin again
Flashback TABLE TOWNS TO BEFORE DROP; -- BRING IT BACK
SELECT * FROM RECYCLEBIN; -- CHECK BIN TO SEE IF ITS REMOVED
--Solution: flashback command to bring the table back

--Task 5 drop table, purge the bin and try bring it back
DROP TABLE TOWNS; -- REMOVE TABLE
PURGE RECYCLEBIN; -- REMOVE EVERYTHING FROM RECYCLE BIN
Flashback TABLE TOWNS TO BEFORE DROP; -- BRING IT BACK
-- ERROR ORA-38305: object not in RECYCLE BIN
-- WHEN TRYING TO BRING IT BACK
--Solution: Dropped the table, purged the bin and tried biring it back with purge and flashback command

--Task 6 create a view from locations where country is canada
CREATE VIEW CAN_CITY_VU AS (
    SELECT Street_Address, Postal_Code, City, State_Province
    FROM locations
    WHERE upper(country_id) = 'CA');
--Solution: used the command create made the view with the specifications

--Task 7 omdify the view from locations
CREATE OR REPLACE VIEW CAN_CITY_VU AS(
    SELECT Street_Address AS "Str_Adr", Postal_Code AS "P_Code", City, State_Province AS "Prov"
    FROM locations);  
--Solution: used the command create or replace and remade the view with new specifications


--Task 8 modify the view where countryid is canada or italy
CREATE VIEW CITY_DNAME_VU AS (
    SELECT Department_Name, City, State_Province
        FROM locations left join departments using(location_id)
        WHERE upper(country_id) IN ('IT', 'CA'));
--Solution: used the command create or replace and remade the view with new specifications

--Task 9 modfy the view and add all cities that arnt in the us
CREATE OR REPLACE VIEW CITY_DNAME_VU AS (
 SELECT Department_Name AS "DName", City, State_Province AS "Prov"
        FROM locations left join departments using(location_id)
        WHERE upper(country_id) IN ('IT', 'CA') OR upper(country_id) != ('US'));
--Solution: used the command create or replace and remade the view with new specifications

--Task 10 select all the views in the database, drop the view and check agains
SELECT view_name FROM user_views; -- CHECK ALL VIEWS

DROP VIEW CITY_DNAME_VU; -- DROP

SELECT view_name FROM user_views; -- CHECK AGAIN
--Solution: ran the select command, droped the view and checked again
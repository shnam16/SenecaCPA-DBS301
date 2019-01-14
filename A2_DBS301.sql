CREATE TABLE Property (
    PropertyID NUMBER PRIMARY KEY,
    AgencyID_FK NUMBER,
    SchoolID_FK NUMBER,
    ClientsID_FK NUMBER,
    LocationID_FK NUMBER,
    HouseOrCondo VARCHAR2(40),
    BedRooms NUMBER,
    BathRooms NUMBER,
    SquareFeet NUMBER,
    LandSize NUMBER,
    MaintFee NUMBER,
    ParkingType NUMBER,
    ParkingSpace NUMBER,
    UtilityType VARCHAR2(40),
    CONSTRAINT AgencyID_FK FOREIGN KEY(AgencyID_FK) REFERENCES Agency(AgencyID),
    CONSTRAINT SchoolID_FK FOREIGN KEY(SchoolID_FK) REFERENCES School(SchoolID),
    CONSTRAINT ClientsID_FK FOREIGN KEY(ClientsID_FK) REFERENCES Clients(clientid),
    CONSTRAINT LocationID_FK FOREIGN KEY(LocationID_FK) REFERENCES Location(LocationID)
    );
    
    CREATE TABLE SoldProperty (
    SoldPropertyID NUMBER PRIMARY KEY,
    PropertyID_FK NUMBER,
    SoldPropertyPersonID_FK NUMBER,
    DateSold DATE,
    CONSTRAINT PropertyID_FK FOREIGN KEY(PropertyID_FK) REFERENCES Property(PropertyID),
    CONSTRAINT SoldPropertyPersonID_FK FOREIGN KEY(SoldPropertyPersonID_FK) REFERENCES Clients(clientid)
    );

    CREATE TABLE Agency(
    AgencyID    INT PRIMARY KEY,
    AgencyName  VARCHAR2(40),
    AgencyPhoneNum INT
    );

    CREATE TABLE Location(
    LocationID INT PRIMARY KEY,
    Country VARCHAR2(40),
    Province VARCHAR2(40),
    City VARCHAR2(50),
    Postal VARCHAR2(6)
    );

--CONSTRAINT ClientID_FK FOREIGN KEY(clientid) REFERENCES Clients(clientid)


CREATE TABLE Clients (
    clientid NUMBER PRIMARY KEY,
    referalid_fk NUMBER,
    firstname varchar2(25),
    lastname varchar2(25),
    phone NUMBER,
    email varchar2(25),
    buyorsell varchar2(25),
    ownership_pct varchar2(25),
    pricesold NUMBER);
    
    
ALTER TABLE Clients 
    ADD CONSTRAINT FK_referal FOREIGN KEY(referalid_fk) REFERENCES Referal(referalid);
    

INSERT INTO Clients (clientid, firstname, lastname)
    VALUES (123, 'bob', 'ffff');

DROP TABLE Referal CASCADE Constraints;

CREATE TABLE Referal
    (
    ReferenceID NUMBER PRIMARY KEY,
    clientid NUMBER,
    CONSTRAINT ClientID_FK FOREIGN KEY(clientid) REFERENCES Clients(clientid)
    );


SELECT * FROM Clients;

INSERT INTO Clients(clientid, firstname, lastname, phone, email, buyorsell, ownership_pct, pricesold)
    VALUES('12', 'bill', 'ross', '123123123', 'email@email.com', 'buy', '0.12', '1000');


CREATE TABLE Area (
    AreaID INT PRIMARY KEY,
    AreaName VARCHAR2(40), 
    AreaComments VARCHAR2(100)
    );




CREATE TABLE School (
    SchoolID INT PRIMARY KEY,
    SchoolName VARCHAR2(40),
    SchoolType VARCHAR2(40)
    );

CREATE TABLE Outlet (
    OutletID INT PRIMARY KEY,
    OutletName VARCHAR(40),
    OutletPhone INT
    );
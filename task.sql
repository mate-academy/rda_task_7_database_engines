CREATE DATABASE ShopDB;

USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;


CREATE TABLE GeoIPCache (
    ID INT,
    IPRange VARCHAR(255),
    CountryID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
) ENGINE=MEMORY;


CREATE TABLE ProductDescription (
    ID INT,
    Description VARCHAR(255),
    ProductID INT,
    CountryID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
) ENGINE=MyISAM;


CREATE TABLE Logs (
    ID INT,
    Timestamp TIMESTAMP,
    Message TEXT,
    PRIMARY KEY (ID)
) ENGINE=BLACKHOLE;


CREATE TABLE ProductReporting (
    Date DATE,
    ProductName VARCHAR(255),
    Orders INT
) ENGINE=CSV;
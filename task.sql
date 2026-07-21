CREATE DATABASE ShopDB; 
USE ShopDB; 

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

CREATE TABLE GeoIPCache (
    ID INT,
    IPRange VARCHAR(50),
    CountryID INT,
    PRIMARY KEY (ID)
) ENGINE=MEMORY;

CREATE TABLE ProductDescription (
    ID INT,
    CountryID INT,
    ProductID INT,
    Description VARCHAR(500),
    PRIMARY KEY (ID)
) ENGINE=MyISAM;

CREATE TABLE Logs (
    ID INT,
    Time DATETIME,
    LogRecord VARCHAR(500),
    PRIMARY KEY (ID)
) ENGINE=BLACKHOLE;

CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(50) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;
CREATE DATABASE ShopDB;

USE ShopDB;
-- Create a table to store countries
CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

CREATE TABLE GeoIPCache (
    ID INT,
    IPRange VARCHAR(50),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries (ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
) ENGINE=Memory;

CREATE TABLE ProductDescription (
    ID INT,
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries (ID) ON DELETE NO ACTION,
    ProductID INT,
    Description VARCHAR(100),
    PRIMARY KEY (ID)
) ENGINE=MyISAM;

CREATE TABLE Logs (
    ID INT,
    Time DATE,
    LogRecord VARCHAR(100),
    PRIMARY KEY (ID)
) ENGINE=Blackhole;

CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(50) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;

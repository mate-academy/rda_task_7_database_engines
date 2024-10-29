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
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
) ENGINE=Memory;

CREATE TABLE ProductDescription (
    ID INT,
    ProductID INT,
    CountryID INT,
    Description VARCHAR(255),
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
) ENGINE=MyISAM;

CREATE TABLE Logs (
    ID INT,
    Time DATETIME,
    LogRecord VARCHAR(255),
    PRIMARY KEY (ID)
) ENGINE=Blackhole;

CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(70) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;

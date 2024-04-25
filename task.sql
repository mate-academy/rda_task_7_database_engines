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
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE CASCADE,
    PRIMARY KEY (ID)
) ENGINE=Memory;

CREATE TABLE ProductDescription (
    ID INT,
    Description VARCHAR(100),
    ProductID INT,
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE CASCADE,
    PRIMARY KEY (ID)
) ENGINE=MyISAM;

CREATE TABLE Logs (
    ID INT,
    Timestamp DATE,
    Message VARCHAR(100),
    PRIMARY KEY (ID)
) ENGINE=Blackhole;

CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(50) NOT NULL,
    Orders VARCHAR(100) NOT NULL
) ENGINE=CSV;

CREATE DATABASE ShopDB; 
USE ShopDB; 

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

CREATE TABLE GeoIPCache (
    ID INT AUTO_INCREMENT,
    IPRange VARCHAR(50),
    CountryID INT,
    PRIMARY KEY (ID)
) ENGINE = Memory;

CREATE TABLE ProductDescription (
    ID INT AUTO_INCREMENT,
    Description TEXT,
    ProductID INT,
    CountryID INT,
    PRIMARY KEY (ID)
) ENGINE = InnoDB;

CREATE TABLE Logs (
    ID INT AUTO_INCREMENT,
    Timestamp TIMESTAMP,
    Message TEXT,
    PRIMARY KEY (ID)
) ENGINE = Blackhole;

CREATE TABLE ProductReporting (
    Date DATE,
    ProductName VARCHAR(50),
    Orders INT
) ENGINE = CSV;

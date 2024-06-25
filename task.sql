CREATE DATABASE ShopDB; 
USE ShopDB; 

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

CREATE TABLE GeoIPCache (
	ID INT,
    IPRange INT,
    CountryID INT,
    PRIMARY KEY (ID)
) ENGINE=Memory;

CREATE TABLE ProductDescription (
	ID INT,
    Description VARCHAR(50),
    ProductID INT,
    CountryID INT,
    PRIMARY KEY (ID)
) ENGINE=MyISAM;

CREATE TABLE Logs (
	ID INT,
    Timestamp DATE,
    Message VARCHAR(5)
) ENGINE=Blackhole;

CREATE TABLE ProductReporting (
	Date DATE NOT NULL,
    ProductName VARCHAR(50) NOT NULL,
    Orders VARCHAR(50) NOT NULL
) ENGINE=CSV;


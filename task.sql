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
) ENGINE=Memory;


CREATE TABLE ProductDescription (
    ID INT,
    Description VARCHAR(500),
    ProductID INT,
    CountryID INT,
    PRIMARY KEY (ID)
) ENGINE=MyISAM;


CREATE TABLE Logs (
    ID INT,
    Timestamp Date,
    Message VARCHAR (500),
    PRIMARY KEY (ID)
) ENGINE=Blackhole;


CREATE TABLE ProductReporting (
    ID INT NOT NULL,
    ProductName VARCHAR(50) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;

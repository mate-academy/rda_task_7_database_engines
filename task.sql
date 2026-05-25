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
    PRIMARY KEY (ID)
) ENGINE=MEMORY;

CREATE TABLE ProductDescription (
    ID INT,
    ProductID INT,
    Description TEXT,
    CountryID INT,
    PRIMARY KEY (ID)
) ENGINE=MyISAM;

CREATE TABLE Logs (
    ID INT,
    Timestamp DATETIME,
    Message TEXT,
    PRIMARY KEY (ID)
) ENGINE=BLACKHOLE;

CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(50) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;

CREATE DATABASE ShopDB; 
USE ShopDB; 

-- Create a table to store countries 
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
) ENGINE = MEMORY;

-- Create a table for storing product descriptions (rare updates, mostly reads, data integrity needed)
CREATE TABLE ProductDescription (
    ID INT AUTO_INCREMENT,
    ProductID INT,
    CountryID INT,
    Description TEXT,
    PRIMARY KEY (ID)
) ENGINE = MyISAM;

-- Create a table for storing logs (data is temporary, does not need persistence)
CREATE TABLE Logs (
    ID INT AUTO_INCREMENT,
    Timestamp DATETIME,
    Message TEXT,
    PRIMARY KEY (ID)
) ENGINE = BLACKHOLE;

-- Create a table for storing reporting data (to be exported as CSV)
CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    Orders INT NOT NULL
) ENGINE = CSV;
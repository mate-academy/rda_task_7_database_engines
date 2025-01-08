CREATE DATABASE ShopDB;
USE ShopDB;

-- Create a table to store countries
CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- Create a table for caching GeoIP data (Columns: ID, IP Range, CountryID)

CREATE TABLE GeoIPCache (
    ID INT,
    IPRange VARCHAR(50),
    CountryID INT,
    PRIMARY KEY (ID)
) ENGINE=MEMORY;

-- Create ProductDescription table with InnoDB engine
CREATE TABLE ProductDescription (
    ID INT NOT NULL,
    Description TEXT NOT NULL,
    ProductID INT NOT NULL,
    CountryID INT NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=MyISAM;

-- Create Logs table with BLACKHOLE engine
CREATE TABLE Logs (
    ID INT,
    Timestamp TIMESTAMP,
    Message TEXT,
    PRIMARY KEY (ID)
) ENGINE=BLACKHOLE;

-- Create ProductReporting table with CSV engine
CREATE TABLE ProductReporting (
     Date DATE NOT NULL,
    ProductName VARCHAR(255) NOT NULL,
    Orders INT NOT NULL

) ENGINE=CSV;
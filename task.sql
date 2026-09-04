CREATE DATABASE ShopDB;

USE ShopDB;

-- Create a table to store countries
CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- Create a table for caching GeoIP data
CREATE TABLE GeoIPCache (
    ID INT,
    IP INT,
    IPRange INT,
    CountryID INT,
    PRIMARY KEY (ID)
) ENGINE=MEMORY;

-- Create a table for storing product descriptions for different countries
CREATE TABLE ProductDescription (
    ID INT,
    CountryID INT,
    ProductID INT,
    Description VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=MyISAM;

-- Create a table for storing logs
CREATE TABLE Logs (
    ID INT,
    Timestamp DATETIME,
    Message VARCHAR(100),
    PRIMARY KEY (ID)
) ENGINE=CSV;

-- Create a table for storing reporting data
CREATE TABLE ProductReporting (
    ReportDate DATE NOT NULL,
    ProductName VARCHAR(50) NOT NULL,
    Orders INT NOT NULL
) ENGINE=FEDERATED;
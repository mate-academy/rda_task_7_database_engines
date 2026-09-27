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
    ID INT PRIMARY KEY,
    IPRange VARCHAR(50),
    CountryID INT
) ENGINE=MEMORY;

-- Create a table for storing product descriptions for different countries
CREATE TABLE ProductDescription (
    ID INT PRIMARY KEY,
    CountryID INT,
    ProductID INT,
    Description TEXT
) ENGINE=MyISAM;

-- Create a table for storing logs
CREATE TABLE Logs (
    ID INT,
    Timestamp DATETIME,
    Message VARCHAR(255)
) ENGINE=BLACKHOLE;

-- Create a table for storing reporting data
CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(255) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;

DROP DATABASE IF EXISTS ShopDB;
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
    ID INT AUTO_INCREMENT NOT NULL,
    IPRange VARCHAR(50),
    CountryID INT,
    INDEX idx_iprange (IPRange),
    PRIMARY KEY (ID)
) ENGINE=MEMORY;

-- Create a table for storing product descriptions for different countries (Columns: ID, CountryID, ProductID, Description )
CREATE TABLE ProductDescription (
    ID INT AUTO_INCREMENT NOT NULL,
    CountryID INT NOT NULL,
    ProductID INT NOT NULL,
    Description TEXT,
    INDEX idx_country_id (CountryID),
    INDEX idx_product_id (ProductID),
    PRIMARY KEY (ID)
) ENGINE=MyISAM;

-- Create a table for storing logs. For now we don't need to save them, but we need to implement functionality (Columns: ID, Time, LogRecord)
CREATE TABLE Logs (
    ID INT AUTO_INCREMENT NOT NULL,
    Timestamp DATETIME,
    Message TEXT,
    PRIMARY KEY (ID)
) ENGINE=BLACKHOLE;

-- Create a table for storing reporting data, which will be send to a separate application in the CSV format for analytics purposes (Columns:  Date, ProductName, Orders)
CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;

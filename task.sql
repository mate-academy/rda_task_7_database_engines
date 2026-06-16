CREATE DATABASE ShopDB; 
USE ShopDB; 

-- Create a table to store countries 
CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- Best performance, stored in RAM only (data lost on restart is acceptable)
CREATE TABLE GeoIPCache (
    ID        INT,
    IPRange   VARCHAR(50),
    CountryID INT,
    PRIMARY KEY (ID)
) ENGINE=MEMORY;

-- Read-heavy, no transactions needed, persists across restarts
CREATE TABLE ProductDescription (
    ID          INT,
    Description TEXT,
    ProductID   INT,
    CountryID   INT,
    PRIMARY KEY (ID)
) ENGINE=MyISAM;

-- Accepts writes but discards all data immediately
CREATE TABLE Logs (
    ID        INT,
    Timestamp DATETIME,
    Message   TEXT,
    PRIMARY KEY (ID)
) ENGINE=BLACKHOLE;

-- Data stored as a plain .csv file, ready for external import
CREATE TABLE ProductReporting (
    Date        DATE          NOT NULL,
    ProductName VARCHAR(100)  NOT NULL,
    Orders      INT           NOT NULL
) ENGINE=CSV;
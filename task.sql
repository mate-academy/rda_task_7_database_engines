CREATE DATABASE ShopDB; 
USE ShopDB; 

-- Create a table to store countries 
CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- Create a table for caching GeoIP data (Columns: ID, IP Range, CountryID)
-- MEMORY: best possible performance; losing cache on restart is acceptable
CREATE TABLE GeoIPCache (
    ID        INT          NOT NULL,
    IPRange   VARCHAR(50)  NOT NULL,
    CountryID INT          NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=MEMORY;

-- Create a table for storing product descriptions for different countries (Columns: ID, CountryID, ProductID, Description)
-- MyISAM: optimised for read-heavy workloads; persistent storage (no data loss on restart)
CREATE TABLE ProductDescription (
    ID          INT           NOT NULL,
    Description VARCHAR(255)  NOT NULL,
    ProductID   INT           NOT NULL,
    CountryID   INT           NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=MyISAM;

-- Create a table for storing logs. For now we don't need to save them, but we need to implement functionality (Columns: ID, Time, LogRecord)
-- BLACKHOLE: accepts writes but discards all data — perfect placeholder while logging system is not ready
CREATE TABLE Logs (
    ID        INT           NOT NULL,
    Timestamp DATETIME      NOT NULL,
    Message   VARCHAR(255)  NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=BLACKHOLE;

-- Create a table for storing reporting data, which will be sent to a separate application in the CSV format for analytics purposes (Columns: Date, ProductName, Orders)
-- CSV: data is stored as a plain CSV file — native integration with the external reporting system
CREATE TABLE ProductReporting (
    Date        DATE         NOT NULL,
    ProductName VARCHAR(50)  NOT NULL,
    Orders      INT          NOT NULL
) ENGINE=CSV;

CREATE DATABASE ShopDB;
USE ShopDB;

-- Create a table to store countries
CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- GeoIP cache: MEMORY engine for maximum performance
-- Acceptable to lose data on server restart
CREATE TABLE GeoIPCache (
    ID INT,
    IPRange VARCHAR(50),
    CountryID INT,
    PRIMARY KEY (ID)
) ENGINE=MEMORY;

-- Product descriptions: MyISAM for read-heavy workloads
-- Persistent storage protects against data loss on restart
CREATE TABLE ProductDescription (
    ID INT,
    Description TEXT,
    ProductID INT,
    CountryID INT,
    PRIMARY KEY (ID)
) ENGINE=MyISAM;

-- Logs: BLACKHOLE accepts writes but never stores them
-- Ideal placeholder until the real logging system is ready
CREATE TABLE Logs (
    ID INT,
    Timestamp DATETIME,
    Message TEXT,
    PRIMARY KEY (ID)
) ENGINE=BLACKHOLE;

-- Product reporting: CSV engine stores data as plain CSV files
-- Allows the external reporting/dashboard tool to read raw data directly
CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;

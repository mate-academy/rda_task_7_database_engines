CREATE DATABASE ShopDB;
USE ShopDB;

-- Countries table (left as InnoDB)
CREATE TABLE Countries (
    ID INT PRIMARY KEY,
    Name VARCHAR(50)
) ENGINE=InnoDB;


-- GeoIPCache → MEMORY (fast, ok to lose on restart)
CREATE TABLE GeoIPCache (
    ID INT PRIMARY KEY,
    IPRange VARCHAR(45),
    CountryID INT
) ENGINE=MEMORY;


-- ProductDescription → MyISAM (fast reads, no need for transactions)
CREATE TABLE ProductDescription (
    ID INT PRIMARY KEY,
    Description TEXT,
    ProductID INT,
    CountryID INT
) ENGINE=MyISAM;


-- Logs → BLACKHOLE (accepts inserts, stores nothing)
CREATE TABLE Logs (
    ID INT PRIMARY KEY,
    Timestamp TIMESTAMP,
    Message TEXT
) ENGINE=BLACKHOLE;


-- ProductReporting → CSV (for export/import to reporting system)
CREATE TABLE ProductReporting (
    Date DATE,
    ProductName VARCHAR(255),
    Orders INT
) ENGINE=CSV;

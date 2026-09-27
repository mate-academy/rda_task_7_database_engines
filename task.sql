CREATE DATABASE ShopDB;
USE ShopDB;

-- Create a table to store countries
CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

CREATE TABLE GeoIPCache (
    ID INT NOT NULL,
    IPRange VARCHAR(50) NOT NULL,
    CountryID INT NOT NULL
) ENGINE=MEMORY;

CREATE TABLE ProductDescription (
    ID INT NOT NULL,
    Description VARCHAR(100) NOT NULL,
    ProductID INT NOT NULL,
    CountryID INT NOT NULL
) ENGINE=MyISAM;

CREATE TABLE Logs (
    ID INT NOT NULL,
    Timestamp DATETIME NOT NULL,
    Message VARCHAR(100) NOT NULL
) ENGINE=BLACKHOLE;

CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(50) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;
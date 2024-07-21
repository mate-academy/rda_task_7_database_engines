CREATE DATABASE ShopDB; 
USE ShopDB; 

-- Create a table to store countries 
CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

USE ShopDB;

CREATE TABLE GeoIPCache (
    ID INT AUTO_INCREMENT,
    IPRange VARCHAR(50),
    CountryID INT,
    PRIMARY KEY (ID)
) ENGINE=MEMORY;

CREATE TABLE ProductDescription (
    ID INT AUTO_INCREMENT,
    Description TEXT,
    ProductID INT,
    CountryID INT,
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

CREATE TABLE Logs (
    ID INT AUTO_INCREMENT,
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Message TEXT,
    PRIMARY KEY (ID)
) ENGINE=BLACKHOLE;

CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(255) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;

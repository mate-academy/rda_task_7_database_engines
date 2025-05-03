CREATE DATABASE ShopDB; 
USE ShopDB; 

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

CREATE TABLE GeoIPCache (
    ID INT PRIMARY KEY,
    IPRange VARCHAR(50),
    CountryID INT
) ENGINE = MEMORY;

CREATE TABLE ProductDescription (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Description TEXT,
    ProductID INT,
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID)
) ENGINE = InnoDB;

CREATE TABLE Logs (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Timestamp DATETIME,
    Message TEXT
) ENGINE = BLACKHOLE;

CREATE TABLE ProductReporting (
    Date DATE,
    ProductName VARCHAR(100),
    Orders INT
) ENGINE = CSV;
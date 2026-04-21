CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

CREATE TABLE GeoIPCache (
    ID INT,
    IPRange INT,
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
) ENGINE=MEMORY;

CREATE TABLE ProductDescription (
    ID INT,
    Description VARCHAR(100),
    ProductID INT,
    CountryID INT,
    PRIMARY KEY (ID)
) ENGINE=MyISAM;

CREATE TABLE Logs (
    ID INT,
    Timestamp TIMESTAMP,
    Message VARCHAR(100),
    PRIMARY KEY (ID)
) ENGINE=BLACKHOLE;

CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(50) NOT NULL,
    Orders VARCHAR(50) NOT NULL
) ENGINE=CSV;
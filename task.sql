CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
)ENGINE=InnoDB;

CREATE TABLE GeoIPCache(
    ID INT,
    IPRange VARCHAR(50),
    CountryID INT
)ENGINE=Memory;

CREATE TABLE ProductDescription(
    ID INT,
    Description VARCHAR(100),
    ProductID INT,
    CountryID INT
)ENGINE=MyISAM;

CREATE TABLE Logs(
    ID INT,
    Timestamp TIMESTAMP,
    Message VARCHAR(100)
)ENGINE=BLACKHOLE;

CREATE TABLE ProductReporting(
    Date DATE,
    ProductName VARCHAR(50),
    Orders INT
)ENGINE=CSV;

DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB; 

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

CREATE TABLE GeoIPCache (
    ID INT,
    IPRange VARCHAR(45) NOT NULL,
    CountryID INT NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=Memory;
CREATE INDEX idx_country_id ON GeoIPCache(CountryID);

CREATE TABLE ProductDescription (
    ID INT,
    CountryID INT NOT NULL,
    ProductID INT NOT NULL,
    Description VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=MyISAM;
CREATE INDEX idx_country_id ON ProductDescription(CountryID);

CREATE TABLE Logs (
    ID INT NOT NULL,
    Timestamp DATETIME NOT NULL,
    Message VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=BLACKHOLE;

CREATE TABLE ProductReporting (
    Date INT NOT NULL,
    ProductName VARCHAR(50) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;

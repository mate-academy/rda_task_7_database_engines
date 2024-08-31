CREATE DATABASE ShopDB; 
USE ShopDB; 

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

CREATE TABLE GeoIPCache (
    ID INT,
    IPRange VARCHAR(50),
    CountryID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
) ENGINE=Memory;

CREATE TABLE ProductDescription  (
    ID INT,
    CountryID INT,
    ProductID INT,
    Description VARCHAR(100),
    PRIMARY KEY (ID),
    FOREIGN KEY (CountryID) REFERENCES Products(ID) ON DELETE NO ACTION,
    FOREIGN KEY (ProductID) REFERENCES Countries(ID) ON DELETE SET NULL
) ENGINE=MyISAM ;

CREATE TABLE Logs (
    ID INT,
    Timestamp TIMESTAMP,
    Message VARCHAR(300),
    PRIMARY KEY (ID)
) ENGINE=Blackhole;

CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(50) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;
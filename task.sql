CREATE DATABASE ShopDB;
USE ShopDB;

-- Create a table to store countries
CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

CREATE TABLE GeoIPCache(
    ID INT,
    IPRange INT,
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE CASCADE,
    PRIMARY KEY (ID)
) ENGINE=Memory;

CREATE TABLE ProductDescription(
    ID INT,
    Description VARCHAR(100),
    CountryID INT,
    ProductID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE CASCADE,
    PRIMARY KEY (ID)
) ENGINE=MyISAM;

CREATE TABLE Logs(
    ID INT,
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Message VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=Blackhole;

CREATE TABLE ProductReporting(
    Date DATE NOT NULL,
    ProductName VARCHAR(50) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;

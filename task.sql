CREATE DATABASE ShopDB; 
USE ShopDB; 

-- Create a table to store countries 
CREATE TABLE Countries (
    ID INT,
        PRIMARY KEY (ID),
    Name VARCHAR(50)
) ENGINE=InnoDB;

-- Create a table for caching GeoIP data (Columns: ID, IP Range, CountryID)
CREATE TABLE GeoIPCache (
    ID INT AUTO_INCREMENT,
        PRIMARY KEY (ID),
    IPRange VARCHAR(100),
    CountryID INT,    
        FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE SET NULL
) ENGINE=Memory;

-- Create a table for storing product descriptions for different countries (Columns: ID, CountryID, ProductID, Description )
CREATE TABLE ProductDescription (
    ID INT AUTO_INCREMENT,
        PRIMARY KEY (ID),
    Description VARCHAR(2000),
    ProductID INT,
    CountryID INT,
        FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE SET NULL
) ENGINE=MyISAM;

-- Create a table for storing logs. For now we don't need to save them, but we need to implement functionality (Columns: ID, Time, LogRecord)
CREATE TABLE Logs (
    ID INT AUTO_INCREMENT,
        PRIMARY KEY (ID),
    Timestamp timestamp,
    Message VARCHAR(2000)
) ENGINE=Blackhole;

-- Create a table for storing reporting data, which will be send to a separate application in the CSV format for analytics purposes (Columns:  Date, ProductName, Orders)
CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(100) NOT NULL DEFAULT ' ',
    Orders INT NOT NULL
) ENGINE=CSV;

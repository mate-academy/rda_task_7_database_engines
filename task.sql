CREATE DATABASE ShopDB; 
USE ShopDB; 


CREATE TABLE GeoIPCache (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    IPRange VARCHAR(50),
    CountryID INT
) ENGINE=MEMORY;

-- Create a table for storing product descriptions for different countries (Columns: ID, CountryID, ProductID, Description )
CREATE TABLE ProductDescription (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    CountryID INT,
    ProductID INT,
    Description VARCHAR(100)
) ENGINE=InnoDB;

-- Create a table for storing logs. For now we don't need to save them, but we need to implement functionality (Columns: ID, Time, LogRecord)
CREATE TABLE Logs (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Timestamp TIMESTAMP,
    Message VARCHAR(100)
) ENGINE=Blackhole;

-- Create a table for storing reporting data, which will be send to a separate application in the CSV format for analytics purposes (Columns:  Date, ProductName, Orders)
CREATE TABLE ProductReporting (
    Date Date NOT NULL,
    ProductName VARCHAR(50) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;

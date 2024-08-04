CREATE DATABASE ShopDB; 
USE ShopDB; 

-- Create a table to store countries 
CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- Create a table for caching GeoIP data (Columns: ID, IP Range, CountryID)
CREATE TABLE GeoIPCache(
    ID INT,
    IPRange VARCHAR(50),
    CountryID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
)ENGINE = MEMORY;

-- Create a table for storing product descriptions for different countries (Columns: ID, CountryID, ProductID, Description)

CREATE TABLE ProductDescriptions(
    ID INT,
    CountryID INT,
    ProductID INT,
    Description TEXT,
    PRIMARY KEY (ID),
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION
)ENGINE = MYISAM;


-- Create a table for storing logs. For now we don't need to save them, but we need to implement functionality (Columns: ID, Time, Message)

CREATE TABLE LogsTable(
    ID INT,
    Time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Message TEXT,
    PRIMARY KEY (ID)
)ENGINE = BLACKHOLE;

-- Create a table for storing reporting data, which will be send to a separate application in the CSV format for analytics purposes (Columns:  Date, ProductName, Orders)

CREATE TABLE ProductReporting(
    Date DATE NOT NULL,
    ProductName VARCHAR(50) NOT NULL,
    Orders INT NOT NULL
)ENGINE = CSV;

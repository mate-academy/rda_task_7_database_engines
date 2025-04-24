DROP DATABASE IF EXISTS ShopDB; 
CREATE DATABASE ShopDB; 
USE ShopDB; 

-- Create a table to store countries 
CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- Create a table for caching GeoIP data (Columns: ID, IP Range, CountryID)
create table GeoIPCache(
	ID int auto_increment not null,
    IPRange varchar(50),
    CountryID INT,
    PRIMARY KEY (ID),
    foreign key (CountryID) REFERENCES Countries (ID) ON DELETE NO ACTION
) ENGINE=Memory;
-- Create a table for storing product descriptions for different countries (Columns: ID, CountryID, ProductID, Description )
Create table ProductDescription(
	ID int auto_increment not null,
    CountryID INT not null,
    ProductID INT not null,
    Description varchar(100),
    PRIMARY KEY (ID),
    foreign key (CountryID) REFERENCES Countries (ID) ON DELETE NO ACTION
) engine=MyISAM;
-- Create a table for storing logs. For now we don't need to save them, but we need to implement functionality (Columns: ID, Time, LogRecord)
create table Logs(
	ID int auto_increment not null,
    Time varchar(26), -- default timestamp length is 26
    LogRecord varchar(200),
    PRIMARY KEY (ID)
) engine=BLACKHOLE;
-- Create a table for storing reporting data, which will be send to a separate application in the CSV format for analytics purposes (Columns:  Date, ProductName, Orders)
create table ProductReporting(
	Date Date not null,
    ProductName varchar(100) not null,
    Orders int not null
) engine=CSV;
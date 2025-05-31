CREATE DATABASE ShopDB; 
USE ShopDB; 

-- Create a table to store countries 
CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- Create a table for caching GeoIP data (Columns: ID, IP Range, CountryID)

create table GeoIPCache (
	ID int,
    IPRange varchar(25),
    CountryID int,
    primary key (ID)
) ENGINE=Memory;

-- Create a table for storing product descriptions for different countries (Columns: ID, CountryID, ProductID, Description )

create table ProductDescription (
	ID int,
    Description varchar(50),
    ProductID int,
    CountryID int,
    primary key (ID)
) engine=MyISAM;

-- Create a table for storing logs. For now we don't need to save them, but we need to implement functionality (Columns: ID, Time, LogRecord)

create table Logs (
	ID int,
    Timestamp timestamp,
    Message varchar(100),
    primary key (ID)
) engine=BLACKHOLE;

-- Create a table for storing reporting data, which will be send to a separate application in the CSV format for analytics purposes (Columns:  Date, ProductName, Orders)

create table ProductReporting (
	ID int NOT NULL,
    Date date NOT NULL,
    ProductName varchar(50) NOT NULL,
    Orders varchar(50) NOT NULL
) engine=CSV;
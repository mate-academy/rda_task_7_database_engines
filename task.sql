CREATE DATABASE ShopDB; 
USE ShopDB; 

-- Create a table to store countries 
CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- Create a table for caching GeoIP data (Columns: ID, IP Range, CountryID)
CREATE table GeoIPCache (
	ID INT,
    IPRange varchar(50),
    CountryID varchar(50),
    primary key (ID)
) engine=MEMORY;

-- Create a table for storing product descriptions for different countries (Columns: ID, CountryID, ProductID, Description )
create table ProductDescription (
	ID INT,
    CountryID varchar(50),
    ProductID varchar(50),
    Description varchar (100),
    primary key (ID)
)engine=MyISAM;

-- Create a table for storing logs. For now we don't need to save them, but we need to implement functionality (Columns: ID, Time, LogRecord)
create table Logs (
	ID INT,
    Timestamp DATE,
    Message varchar(100),
    primary key (ID)
)engine=BLACKHOLE;


-- Create a table for storing reporting data, which will be send to a separate application in the CSV format for analytics purposes (Columns:  Date, ProductName, Orders)
create table ProductReporting (
	Date date NOT NULL,
    ProductName varchar(50) NOT NULL,
    Orders INT NOT NULL
)engine=CSV;
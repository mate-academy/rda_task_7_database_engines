-- Create database if it does not exist and switch to it
CREATE DATABASE IF NOT EXISTS ShopDB;
USE ShopDB;

-- Create GeoIPCache table with MEMORY engine for maximum performance (data loss on restart is fine)
CREATE TABLE IF NOT EXISTS GeoIPCache (
    ID INT,
    IPRange VARCHAR(50),
    CountryID INT,
    PRIMARY KEY (ID)
) ENGINE=MEMORY;

-- Create ProductDescription table with InnoDB engine for data protection and high read performance
CREATE TABLE IF NOT EXISTS ProductDescription (
    ID INT,
    Description TEXT,
    ProductID INT,
    CountryID INT,
    PRIMARY KEY (ID)
) ENGINE=MyISAM;

-- Create Logs table with BLACKHOLE engine to accept data without storing it
CREATE TABLE IF NOT EXISTS Logs (
    ID INT,
    Timestamp TIMESTAMP,
    Message TEXT
) ENGINE=BLACKHOLE;

-- Create ProductReporting table with CSV engine to store data as a comma-separated flat file
CREATE TABLE IF NOT EXISTS ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    Orders INT NOT NULL
) ENGINE=CSV;

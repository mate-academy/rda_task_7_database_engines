DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB;

-- Таблиця країн (InnoDB)
CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- Таблиця кешу GeoIP (MEMORY) — вимагає PRIMARY KEY
CREATE TABLE GeoIPCache (
    ID INT PRIMARY KEY,
    IPRange VARCHAR(50),
    CountryID INT
) ENGINE=MEMORY;

-- Таблиця описів продуктів (MyISAM) — краще мати PRIMARY KEY
CREATE TABLE ProductDescription (
    ID INT PRIMARY KEY,
    Description TEXT,
    ProductID INT,
    CountryID INT
) ENGINE=MyISAM;

-- Таблиця логів (BLACKHOLE) — для сумісності краще мати PRIMARY KEY
CREATE TABLE Logs (
    ID INT PRIMARY KEY,
    Timestamp DATETIME,
    Message TEXT
) ENGINE=BLACKHOLE;

-- Таблиця для CSV-звітності — рушій CSV вимагає PRIMARY KEY
CREATE TABLE ProductReporting (
    Date DATE,
    ProductName CHAR(30),
    Orders INT,
    PRIMARY KEY (Date, ProductName)
) ENGINE=CSV;




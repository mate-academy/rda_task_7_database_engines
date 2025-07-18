CREATE DATABASE ShopDB; 
USE ShopDB; 

-- Create a table to store countries 
CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- 3. GeoIPCache
-- Дані кешуються, можна втратити після рестарту → ENGINE=MEMORY
CREATE TABLE GeoIPCache (
    ID INT PRIMARY KEY,
    IPRange VARCHAR(50),
    CountryID INT
) ENGINE=MEMORY;

-- 4. ProductDescription
-- Таблиця з частими читаннями, мало оновлень → ENGINE=MyISAM
CREATE TABLE ProductDescription (
    ID INT PRIMARY KEY,
    Description TEXT,
    ProductID INT,
    CountryID INT
) ENGINE=MyISAM;

-- 5. Logs
-- Нічого не зберігаємо, просто приймаємо дані → ENGINE=BLACKHOLE
CREATE TABLE Logs (
    ID INT PRIMARY KEY,
    Timestamp DATETIME,
    Message TEXT
) ENGINE=BLACKHOLE;

-- 6. ProductReporting
-- Дані експортуються у CSV-файл → ENGINE=CSV
CREATE TABLE ProductReporting (
    Date DATE,
    ProductName VARCHAR(255),
    Orders INT
) ENGINE=CSV;
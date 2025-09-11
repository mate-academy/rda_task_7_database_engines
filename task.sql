DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB; 

-- Create a table to store countries 
CREATE TABLE Countries (
    ID INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Кеш GeoIP (MEMORY — максимальна швидкість, можна втратити при рестарті)
CREATE TABLE GeoIPCache (
    ID INT NOT NULL PRIMARY KEY,
    IPRange VARCHAR(50) NOT NULL,
    CountryID INT NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;

-- Опис продуктів (MyISAM — швидке читання, зберігає на диску)
CREATE TABLE ProductDescription (
    ID INT NOT NULL PRIMARY KEY,
    CountryID INT NOT NULL,
    ProductID INT NOT NULL,
    Description TEXT NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- Логи (BLACKHOLE — приймає дані, але не зберігає)
CREATE TABLE Logs (
    ID INT NOT NULL,
    Time TIMESTAMP NOT NULL,
    LogRecord TEXT NOT NULL
) ENGINE=BLACKHOLE DEFAULT CHARSET=utf8mb4;

-- Звітність (CSV — зберігає у CSV-файлі для експорту)
CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    Orders INT UNSIGNED NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8mb4;

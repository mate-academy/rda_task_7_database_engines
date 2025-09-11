DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB;

-- Countries (InnoDB за умовою)
CREATE TABLE Countries (
    ID INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- GeoIPCache (MEMORY — швидкість, можна втратити при рестарті)
CREATE TABLE GeoIPCache (
    ID INT NOT NULL PRIMARY KEY,
    IPRange VARCHAR(50) NOT NULL,
    CountryID INT NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;

-- ProductDescription (InnoDB — надійність, збереження після рестарту)
CREATE TABLE ProductDescription (
    ID INT NOT NULL PRIMARY KEY,
    Description TEXT NOT NULL,
    ProductID INT NOT NULL,
    CountryID INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Logs (BLACKHOLE — приймає дані, але не зберігає; назви колонок як у вимогах)
CREATE TABLE Logs (
    ID INT NOT NULL,
    Timestamp TIMESTAMP NOT NULL,
    Message TEXT NOT NULL
) ENGINE=BLACKHOLE DEFAULT CHARSET=utf8mb4;

-- ProductReporting (CSV — для експорту у CSV)
CREATE TABLE ProductReporting (
    Date DATE NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    Orders INT UNSIGNED NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8mb4;

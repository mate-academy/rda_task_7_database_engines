DROP DATABASE IF EXISTS ShopDB;

-- Створення бази даних та вибір її
CREATE DATABASE ShopDB;
USE ShopDB;

-- Таблиця країн (потрібна для зв'язків)
CREATE TABLE Countries (
    ID INT PRIMARY KEY,
    Name VARCHAR(50)
) ENGINE=InnoDB;

-- Таблиця складів
CREATE TABLE Warehouses (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Address VARCHAR(100),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID)
) ENGINE=InnoDB;

-- Таблиця продуктів
CREATE TABLE Products (
    ID INT PRIMARY KEY,
    Name VARCHAR(50)
) ENGINE=InnoDB;

-- Інвентар товарів на складах
CREATE TABLE ProductInventory (
    ProductID INT,
    WarehouseID INT,
    Amount INT,
    PRIMARY KEY (ProductID, WarehouseID),
    FOREIGN KEY (ProductID) REFERENCES Products(ID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID)
) ENGINE=InnoDB;

-- Таблиця GeoIPCache
-- Дані не важливі, продуктивність важлива, допустима втрата при перезапуску → ENGINE=MEMORY
CREATE TABLE GeoIPCache (
    ID INT PRIMARY KEY,
    IPRange VARCHAR(50),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID)
) ENGINE=MEMORY;

-- Таблиця ProductDescription
-- Читання часте, зміни рідкісні, важливість даних висока → ENGINE=InnoDB
CREATE TABLE ProductDescription (
    ID INT PRIMARY KEY,
    Description TEXT,
    ProductID INT,
    CountryID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ID),
    FOREIGN KEY (CountryID) REFERENCES Countries(ID)
) ENGINE=InnoDB;

-- Таблиця Logs
-- Зберігати дані не обов'язково, просто приймати → ENGINE=BLACKHOLE
CREATE TABLE Logs (
    ID INT PRIMARY KEY,
    Timestamp DATETIME,
    Message TEXT
) ENGINE=BLACKHOLE;

-- Таблиця ProductReporting
-- Для імпорту з CSV, аналітики, зберігання даних → ENGINE=CSV
CREATE TABLE ProductReporting (
    Date DATE,
    ProductName VARCHAR(100),
    Orders INT
) ENGINE=CSV;
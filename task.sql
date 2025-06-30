CREATE DATABASE ShopDB; 
USE ShopDB; 

-- Create a table to store countries 
CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- Create a table for caching GeoIP data (Columns: ID, IP Range, CountryID)
CREATE TABLE GeoIPCache (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    IPRange VARCHAR(100) NOT NULL,
    CountryID INT NOT NULL
) ENGINE=MEMORY;  -- Найвища швидкість, дані втрачаються при перезавантаженні

-- Create a table for storing product descriptions for different countries (Columns: ID, CountryID, ProductID, Description )
CREATE TABLE ProductDescription (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Description TEXT NOT NULL,
    ProductID INT NOT NULL,
    CountryID INT NOT NULL
) ENGINE=MyISAM;  -- Оптимізований для читання, збереження даних після перезавантаження

-- Create a table for storing logs (Columns: ID, Time, LogRecord)
CREATE TABLE Logs (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    `Timestamp` DATETIME NOT NULL,
    Message TEXT
) ENGINE=BLACKHOLE;  -- Дані не зберігаються (вимога розробників)

-- Create a table for reporting data (Columns: Date, ProductName, Orders)
CREATE TABLE ProductReporting (
    `Date` DATE NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    Orders INT DEFAULT 0
) ENGINE=CSV;  -- Зберігає дані у CSV форматі для експорту

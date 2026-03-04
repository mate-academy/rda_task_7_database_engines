USE ShopDB;

-- Table for caching IP ranges and country IDs
-- Fast access is required and data loss after restart is acceptable
CREATE TABLE GeoIPCache (
    ID INT PRIMARY KEY,
    IPRange VARCHAR(50),
    CountryID INT
) ENGINE=MEMORY;


-- Table for storing product descriptions depending on country
-- Mostly read operations, data must persist
CREATE TABLE ProductDescription (
    ID INT PRIMARY KEY,
    Description TEXT,
    ProductID INT,
    CountryID INT
) ENGINE=MyISAM;


-- Temporary logs table where data does not need to be stored
CREATE TABLE Logs (
    ID INT PRIMARY KEY,
    Timestamp DATETIME,
    Message TEXT
) ENGINE=BLACKHOLE;


-- Table that stores data for reporting system which imports CSV
CREATE TABLE ProductReporting (
    Date DATE,
    ProductName VARCHAR(255),
    Orders INT
) ENGINE=CSV;
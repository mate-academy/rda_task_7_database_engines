USE ShopDB;

-- Table for caching GeoIP data (fast, can be lost after restart)
CREATE TABLE GeoIPCache (
    ID INT PRIMARY KEY,
    IPRange VARCHAR(50),
    CountryID INT
) ENGINE=MEMORY;

-- Table for storing product descriptions (reliable, read-heavy)
CREATE TABLE ProductDescription (
    ID INT PRIMARY KEY,
    Description TEXT,
    ProductID INT,
    CountryID INT
) ENGINE=InnoDB;

-- Table for storing logs (we accept data but do not save it)
CREATE TABLE Logs (
    ID INT PRIMARY KEY,
    Timestamp DATETIME,
    Message TEXT
) ENGINE=BLACKHOLE;

-- Table for reporting system (CSV-based import/export)
CREATE TABLE ProductReporting (
    Date DATE,
    ProductName VARCHAR(100),
    Orders INT
) ENGINE=CSV;
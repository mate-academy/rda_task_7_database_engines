# Storage Engines Analysis and Validation

## 1. How to Deploy and Run the Script
To initialize the database structure, apply the SQL script against your MySQL server:

```sql
-- Ensure database exists
CREATE DATABASE IF NOT EXISTS ShopDB;
USE ShopDB;

-- Run the task commands
SOURCE task.sql;
```

## 2. How to Validate the Solution
To verify that each table was created with the correct storage engine, run the following SQL query in your MySQL client:

```sql
SHOW TABLE STATUS WHERE Name IN ('GeoIPCache', 'ProductDescription', 'Logs', 'ProductReporting');
```

### Expected Engines Output:
* **GeoIPCache:** Engine should be `MEMORY`
* **ProductDescription:** Engine should be `InnoDB`
* **Logs:** Engine should be `BLACKHOLE`
* **ProductReporting:** Engine should be `CSV`

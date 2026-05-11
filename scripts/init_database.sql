/*
========================================================================================
CREATE DATABASE AND SCHEMAS
========================================================================================
SCRIPT PURPOSE:
This script creates a new database named "DataWarehouse" after checking its existance. If 
the database already exists, it will be dropped and recreated. The script will additionaly
set up three schemas within the database namely 'bronze', 'silver',and 'gold'.

WARNING:
Running this script will drop the entire "DataWarehouse" database should it exist and all 
existing data in the DataWarehouse database will be permanently deleted. Run this script 
only in a development or test environment.
*/

USE master;

IF EXISTS (SELECT 1 FROM sys.databases WHERE name= 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- CREATE DATABASE [DATA WAREHOUSE]

CREATE DATABASE DataWarehouse;

USE DataWarehouse;
GO

-- CREATE SCHEMAS

CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

IF EXISTS (SELECT 1 FROM sys.databases WHERE name= 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END
GO

/*
================================================================================
STORED PROCEDURE: Load Bronze Layer (Source Systems -> Bronze)
================================================================================
PURPOSE: 
- This stored procedure loads data into the bronze schema from external CSV files.
- It first truncates the bronze tables before loading the data and uses the BULK 
  INSERT command to load data from csv files to the bronze tables.
- The stored procedure does not accept any parameters or return any values.
- e.g EXEC bronze.load_bronze;
==================================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, 
			@end_time DATETIME,
			@batch_start_time DATETIME,
			@batch_end_time DATETIME;

	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT'===================================================================='
		PRINT'Loading Bronze Layer'
		PRINT'===================================================================='

		PRINT'--------------------------------------------------------------------'
		PRINT'Loading CRM tables'
		PRINT'--------------------------------------------------------------------'

		SET @start_time = GETDATE();
		PRINT'>> Truncating table: bronze.crm_cust_info'
		TRUNCATE TABLE bronze.crm_cust_info

		PRINT'>> Inserting data into: bronze.crm_cust_info'
		BULK INSERT bronze.crm_cust_info
		FROM 'D:\BI\GitHub\Data_Warehouse\dwh_project\source_crm\cust_info.csv'
		WITH 
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT'>> Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) +' seconds';
		PRINT'------------------------'

		SET @start_time = GETDATE();
		PRINT'>> Truncating table: bronze.crm_prd_info'
		TRUNCATE TABLE bronze.crm_prd_info

		PRINT'>> Inserting data into: bronze.crm_prd_info'
		BULK INSERT bronze.crm_prd_info
		FROM 'D:\BI\GitHub\Data_Warehouse\dwh_project\source_crm\prd_info.csv'
		WITH 
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT'>> Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) +' seconds';
		PRINT'------------------------'

		SET @start_time = GETDATE();
		PRINT'>> Truncating table: bronze.crm_sales_details'
		TRUNCATE TABLE bronze.crm_sales_details

		PRINT'>> Inserting data into: bronze.crm_sales_details'
		BULK INSERT bronze.crm_sales_details
		FROM 'D:\BI\GitHub\Data_Warehouse\dwh_project\source_crm\sales_details.csv'
		WITH 
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT'>> Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) +' seconds';
		PRINT'------------------------'


		PRINT'--------------------------------------------------------------------'
		PRINT'Loading ERP tables'
		PRINT'--------------------------------------------------------------------'

		SET @start_time = GETDATE();
		PRINT'>> Truncating table: bronze.erp_CUST_AZ12'
		TRUNCATE TABLE bronze.erp_CUST_AZ12

		PRINT'>> Inserting data into: bronze.erp_CUST_AZ12'
		BULK INSERT bronze.erp_CUST_AZ12
		FROM 'D:\BI\GitHub\Data_Warehouse\dwh_project\source_erp\CUST_AZ12.csv'
		WITH 
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT'>> Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) +' seconds';
		PRINT'------------------------'

		SET @start_time = GETDATE();
		PRINT'>> Truncating table: bronze.erp_LOC_A101'
		TRUNCATE TABLE bronze.erp_LOC_A101

		PRINT'>> Inserting data into: bronze.erp_LOC_A101'
		BULK INSERT bronze.erp_LOC_A101
		FROM 'D:\BI\GitHub\Data_Warehouse\dwh_project\source_erp\LOC_A101.csv'
		WITH 
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT'>> Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) +' seconds';
		PRINT'------------------------'

		SET @start_time = GETDATE();
		PRINT'>> Truncating table: bronze.erp_PX_CAT_G1V2'
		TRUNCATE TABLE bronze.erp_PX_CAT_G1V2

		PRINT'>> Inserting data into: bronze.erp_PX_CAT_G1V2'
		BULK INSERT bronze.erp_PX_CAT_G1V2
		FROM 'D:\BI\GitHub\Data_Warehouse\dwh_project\source_erp\PX_CAT_G1V2.csv'
		WITH 
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT'>> Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) +' seconds';
		PRINT'>>----------------';

		SET @batch_end_time = GETDATE();
		PRINT'================================================================='
		PRINT'Loading bronze layer is completed';
		PRINT' - Total load duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT'=================================================================';
	END TRY
	BEGIN CATCH
		PRINT'================================================================'
		PRINT'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT'ERROR MESSEGE' + ERROR_MESSAGE();
		PRINT'ERROR MESSEGE' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT'ERROR MESSEGE' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT'ERROR MESSEGE' + CAST(ERROR_SEVERITY() AS NVARCHAR);
		PRINT'ERROR MESSEGE' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT'================================================================'
	END CATCH

END


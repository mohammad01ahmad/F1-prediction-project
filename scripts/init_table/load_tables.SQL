-- Loading data into the tables 

CREATE OR ALTER PROCEDURE load_tables AS
BEGIN 
	BEGIN TRY
		PRINT 'LOADING ALL TABLES'
		PRINT '=========================================='

		PRINT '	LOADING Constructor_Performance'
			TRUNCATE TABLE Constructor_Performance;
			BULK INSERT Constructor_Performance
			FROM 'C:\Users\Administrator\F1_prediction\datasets\Constructor_Performance.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				ROWTERMINATOR = '0x0a',
				TABLOCK
			);

		PRINT '	LOADING Constructor_Rankings'
			TRUNCATE TABLE Constructor_Rankings;
			BULK INSERT Constructor_Rankings
			FROM 'C:\Users\Administrator\F1_prediction\datasets\Constructor_Rankings.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				ROWTERMINATOR = '0x0a',
				TABLOCK
			);

		PRINT '	LOADING Driver_Details'
		TRUNCATE TABLE Driver_Details;
		BULK INSERT Driver_Details
		FROM 'C:\Users\Administrator\F1_prediction\datasets\Driver_Details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);

		PRINT '	LOADING Driver_Rankings'
		TRUNCATE TABLE Driver_Rankings;
		BULK INSERT Driver_Rankings
		FROM 'C:\Users\Administrator\F1_prediction\datasets\Driver_Rankings.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);

		PRINT '	LOADING Lap_Timings'
		TRUNCATE TABLE Lap_Timings;
		BULK INSERT Lap_Timings
		FROM 'C:\Users\Administrator\F1_prediction\datasets\Lap_Timings.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);

		PRINT '	LOADING Pit_Stop_Records'
		TRUNCATE TABLE Pit_Stop_Records;
		BULK INSERT Pit_Stop_Records
		FROM 'C:\Users\Administrator\F1_prediction\datasets\Pit_Stop_Records.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);

		PRINT '	LOADING Qualifying_Results'
		TRUNCATE TABLE Qualifying_Results;
		BULK INSERT Qualifying_Results
		FROM 'C:\Users\Administrator\F1_prediction\datasets\Qualifying_Results.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);

		PRINT '	LOADING Race_Results'
		TRUNCATE TABLE Race_Results;
		BULK INSERT Race_Results
		FROM 'C:\Users\Administrator\F1_prediction\datasets\Race_Results.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);

		PRINT '	LOADING Race_Schedule'
		TRUNCATE TABLE Race_Schedule;
		BULK INSERT Race_Schedule
		FROM 'C:\Users\Administrator\F1_prediction\datasets\Race_Schedule.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);

		PRINT '	LOADING Race_Status'
		TRUNCATE TABLE Race_Status;
		BULK INSERT Race_Status
		FROM 'C:\Users\Administrator\F1_prediction\datasets\Race_Status.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);

		PRINT '	LOADING Season_Summaries'
		TRUNCATE TABLE Season_Summaries;
		BULK INSERT Season_Summaries
		FROM 'C:\Users\Administrator\F1_prediction\datasets\Season_Summaries.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);

		PRINT '	LOADING Sprint_Race_Results'
		TRUNCATE TABLE Sprint_Race_Results;
		BULK INSERT Sprint_Race_Results
		FROM 'C:\Users\Administrator\F1_prediction\datasets\Sprint_Race_Results.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);
	
		PRINT '	LOADING Team_Details'
		TRUNCATE TABLE Team_Details;
		BULK INSERT Team_Details
		FROM 'C:\Users\Administrator\F1_prediction\datasets\Team_Details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);

		PRINT '	LOADING Track_Information'
		TRUNCATE TABLE Track_Information;
		BULK INSERT Track_Information
		FROM 'C:\Users\Administrator\F1_prediction\datasets\Track_Information.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);

		PRINT 'ALL TABLES LOADED SUCCESSFULLY'
		PRINT '============================================'

	END TRY 
	BEGIN CATCH 
		PRINT '============================================'
		PRINT 'Error Message ' + CAST(ERROR_MESSAGE() AS NVARCHAR);
		PRINT 'Error Number ' +  CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error State' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '============================================'
	END CATCH
END

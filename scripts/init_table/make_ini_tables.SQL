-- Create the initial tables that are empty

CREATE OR ALTER PROCEDURE make_ini_tables AS
BEGIN
	BEGIN TRY
		IF OBJECT_ID ('dbo.Constructor_Performance', 'U') IS NOT NULL
			DROP TABLE Constructor_Performance;
		CREATE TABLE Constructor_Performance (
			cp_constructorResultsId INT,
			cp_raceId INT,
			cp_constructorId INT,
			cp_points DECIMAL(6,3),
			cp_status NVARCHAR(3)
		);

		IF OBJECT_ID ('dbo.Constructor_Rankings', 'U') IS NOT NULL
			DROP TABLE Constructor_Rankings;
		CREATE TABLE Constructor_Rankings (
			cr_constructorStandingsId INT,
			cr_raceId INT,
			cr_constructorId INT,
			cr_points DECIMAL(5,2),
			cr_position INT,
			cr_positionText NVARCHAR(5),
			cr_wins INT
		);

		IF OBJECT_ID ('dbo.Driver_Details', 'U') IS NOT NULL
			DROP TABLE Driver_Details;
		CREATE TABLE Driver_Details (
			dd_driverId INT,
			dd_driverRef NVARCHAR(100),
			dd_number NVARCHAR(5),
			dd_code NVARCHAR(10),
			dd_forename NVARCHAR(200),
			dd_surname NVARCHAR(200),
			dd_dob NVARCHAR(50),
			dd_nationality NVARCHAR(100),
			dd_url VARCHAR(500)
		);

		IF OBJECT_ID ('dbo.Driver_Rankings', 'U') IS NOT NULL
			DROP TABLE Driver_Rankings;
		CREATE TABLE Driver_Rankings (
			dr_driverStandingsId INT,
			dr_raceId INT,
			dr_driverId INT,
			dr_points DECIMAL(5,2),
			dr_position INT,
			dr_positionText VARCHAR(5),
			dr_wins INT
		);

		IF OBJECT_ID ('dbo.Lap_Timings', 'U') IS NOT NULL
			DROP TABLE Lap_Timings;
		CREATE TABLE Lap_Timings (
			lt_raceId INT,
			lt_driverId INT,
			lt_lap INT,
			lt_position INT,
			lt_time VARCHAR(40),
			lt_milliseconds VARCHAR(40)
		);

		IF OBJECT_ID ('dbo.Pit_Stop_Records', 'U') IS NOT NULL
			DROP TABLE Pit_Stop_Records;
		CREATE TABLE Pit_Stop_Records (
			pts_raceId INT,
			pts_driverId INT,
			pts_stop INT,
			pts_lap INT,
			pts_time VARCHAR(40),
			pts_duration VARCHAR(40),
			pts_milliseconds INT
		);

		IF OBJECT_ID ('dbo.Qualifying_Results', 'U') IS NOT NULL
			DROP TABLE Qualifying_Results;
		CREATE TABLE Qualifying_Results (
			qs_qualifyId INT,
			qs_raceId INT,
			qs_driverId INT,
			qs_constructorId INT,
			qs_number INT,
			qs_position INT,
			qs_q1 VARCHAR(40),
			qs_q2 VARCHAR(40),
			qs_q3 VARCHAR(40)
		);

		IF OBJECT_ID ('dbo.Race_Results', 'U') IS NOT NULL
			DROP TABLE Race_Results;
		CREATE TABLE Race_Results (
			rr_resultsId INT,
			rr_raceId INT,
			rr_driverId INT,
			rr_constructorId INT,
			rr_number VARCHAR(40),
			rr_grid INT,
			rr_position VARCHAR(40),
			rr_positionText NVARCHAR(20),
			rr_positionOrder INT,
			rr_points VARCHAR(40),
			rr_laps INT,
			rr_time VARCHAR(40),
			rr_milliseconds VARCHAR(40),
			rr_fastestLap VARCHAR(40),
			rr_rank VARCHAR(40),
			rr_fastestLapTime VARCHAR(40),
			rr_fastestSpeed VARCHAR(40),
			rr_statusId INT
		);

		IF OBJECT_ID ('dbo.Race_Schedule', 'U') IS NOT NULL
			DROP TABLE Race_Schedule;
		CREATE TABLE Race_Schedule (
			rs_raceId INT,
			rs_year INT,
			rs_round INT,
			rs_circuitId INT,
			rs_name NVARCHAR(100),
			rs_date NVARCHAR(100),
			rs_time NVARCHAR(100),
			rs_url VARCHAR(500),
			rs_fp1_date NVARCHAR(100),
			rs_fp1_time NVARCHAR(100),
			rs_fp2_date NVARCHAR(100),
			rs_fp2_time NVARCHAR(100),
			rs_fp3_date NVARCHAR(100),
			rs_fp3_time NVARCHAR(100),
			rs_quali_date NVARCHAR(100),
			rs_quali_time NVARCHAR(100),
			rs_sprint_date NVARCHAR(100),
			rs_sprint_time NVARCHAR(100)
		);

		IF OBJECT_ID ('dbo.Race_Status', 'U') IS NOT NULL
			DROP TABLE Race_Status;
		CREATE TABLE Race_Status (
			rst_statusId INT,
			rst_status NVARCHAR(100)
		);

		IF OBJECT_ID ('dbo.Season_Summaries', 'U') IS NOT NULL
			DROP TABLE Season_Summaries;
		CREATE TABLE Season_Summaries (
			ss_year INT,
			ss_url VARCHAR(500)
		);

		IF OBJECT_ID ('dbo.Sprint_Race_Results', 'U') IS NOT NULL
			DROP TABLE Sprint_Race_Results;
		CREATE TABLE Sprint_Race_Results (
			srr_resultsId INT,
			srr_raceId INT,
			srr_driverId INT,
			srr_constructorId INT,
			srr_number NVARCHAR(100),
			srr_grid NVARCHAR(100),
			srr_position NVARCHAR(100),
			srr_positionText NVARCHAR(100),
			srr_positionOrder NVARCHAR(100),
			srr_points NVARCHAR(100),
			srr_laps NVARCHAR(100),
			srr_time NVARCHAR(100),
			srr_milliseconds NVARCHAR(100),
			srr_fastestLap NVARCHAR(100),
			srr_fastestLapTime NVARCHAR(100),
			srr_statusId INT
		);

		IF OBJECT_ID ('dbo.Team_Details', 'U') IS NOT NULL
			DROP TABLE Team_Details;
		CREATE TABLE Team_Details (
			td_constructorId INT,
			td_constructorRef NVARCHAR(100),
			td_name NVARCHAR(100),
			td_nationality NVARCHAR(100),
			td_url VARCHAR(500)
		);

		IF OBJECT_ID ('dbo.Track_Information', 'U') IS NOT NULL
			DROP TABLE Track_Information;
		CREATE TABLE Track_Information (
			ti_circuitId INT,
			ti_circuitRef NVARCHAR(100),
			ti_name NVARCHAR(200),
			ti_location NVARCHAR(100),
			ti_country NVARCHAR(100),
			ti_lat DECIMAL(10, 6),
			ti_lng DECIMAL(10, 6),
			ti_alt NVARCHAR(100),
			ti_url VARCHAR(500)
		);
	END TRY 
	BEGIN CATCH 
		PRINT '============================================'
		PRINT 'Error Message ' + CAST(ERROR_MESSAGE() AS NVARCHAR);
		PRINT 'Error Number ' +  CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error State' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '============================================'
	END CATCH
END		
		

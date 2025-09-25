-- create the stage (stg) tables without any data

CREATE OR ALTER PROCEDURE stg.make_stg_tables AS
BEGIN
	BEGIN TRY
			IF OBJECT_ID ('stg.Constructor_Performance', 'U') IS NOT NULL
				DROP TABLE stg.Constructor_Performance;
			CREATE TABLE stg.Constructor_Performance(
				cp_constructorResultsId INT,
				cp_raceId INT,
				cp_constructorId INT,
				cp_points DECIMAL(5,2)
			);

			IF OBJECT_ID ('stg.Constructor_Rankings', 'U') IS NOT NULL
				DROP TABLE stg.Constructor_Rankings;
			CREATE TABLE stg.Constructor_Rankings(
					cr_constructorStandingsId INT, 
					cr_raceId INT,
					cr_constructorId INT,
					cr_points DECIMAL(5,2),
					cr_position INT,
					cr_wins INT	
				);

			IF OBJECT_ID ('stg.Driver_Details', 'U') IS NOT NULL
				DROP TABLE stg.Driver_Details;
			CREATE TABLE stg.Driver_Details(
				dd_driverId INT,
				dd_name NVARCHAR(100),
				dd_nationality NVARCHAR(100),
				dd_dob DATE
			);


			IF OBJECT_ID ('stg.Driver_Rankings', 'U') IS NOT NULL
				DROP TABLE stg.Driver_Rankings;
			CREATE TABLE stg.Driver_Rankings(
					dr_driverStandingsId INT,
					dr_raceId INT,
					dr_driverId INT,
					dr_points DECIMAL(5,2),
					dr_position INT,
					dr_wins INT
				);


			IF OBJECT_ID ('stg.Lap_Timings', 'U') IS NOT NULL
				DROP TABLE stg.Lap_Timings;
			CREATE TABLE stg.Lap_Timings(
				lt_raceId INT,
				lt_driverId INT,
				lt_lap INT,
				lt_position INT,
				lt_time TIME(3),
				lt_milliseconds INT
			);


			IF OBJECT_ID ('stg..Pit_Stop_Records', 'U') IS NOT NULL
				DROP TABLE stg.Pit_Stop_Records;
			CREATE TABLE stg.Pit_Stop_Records(
				pts_raceId INT,
				pts_driverId INT,
				pts_stop INT,
				pts_lap INT,	
				pts_milliseconds INT
			);


			IF OBJECT_ID ('stg.Qualifying_Results', 'U') IS NOT NULL
				DROP TABLE stg.Qualifying_Results;
			CREATE TABLE stg.Qualifying_Results(
				qs_qualifyId INT,
				qs_raceId INT,
				qs_driverId INT,
				qs_constructorId INT,
				qs_number INT,
				qs_position INT,	
				qs_q1 NVARCHAR(20),
				qs_q2 NVARCHAR(20),
				qs_q3 NVARCHAR(20)
			);


			IF OBJECT_ID ('stg.Race_Results', 'U') IS NOT NULL
				DROP TABLE stg.Race_Results;
			CREATE TABLE stg.Race_Results(
				rr_resultsId INT,
				rr_raceId INT,
				rr_driverId INT,
				rr_constructorId INT,
				rr_number INT,
				rr_grid INT,
				rr_position INT,
				rr_positionOrder INT,
				rr_points NVARCHAR(40),
				rr_laps INT,
				rr_time NVARCHAR(40),
				rr_milliseconds NVARCHAR(40),
				rr_fastestLap NVARCHAR(40),
				rr_rank NVARCHAR(40),
				rr_fastestLapTime NVARCHAR(40),
				rr_fastestSpeed NVARCHAR(40),
				rr_statusId INT
			);


			IF OBJECT_ID ('stg.Race_Schedule', 'U') IS NOT NULL
				DROP TABLE stg.Race_Schedule;
			CREATE TABLE stg.Race_Schedule(
				rs_raceId INT,
				rs_year INT,
				rs_round INT,
				rs_circuitId INT,
				rs_name NVARCHAR(100),
				rs_date NVARCHAR(100),
				rs_time NVARCHAR(100),
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

			IF OBJECT_ID ('stg.Race_Status', 'U') IS NOT NULL
				DROP TABLE stg.Race_Status;
			CREATE TABLE stg.Race_Status(
				rst_statusId INT,
				rst_status NVARCHAR(100)
			);


			IF OBJECT_ID ('stg.Season_Summaries', 'U') IS NOT NULL
				DROP TABLE stg.Season_Summaries;
			CREATE TABLE stg.Season_Summaries(
				ss_year INT,
				ss_url NVARCHAR(500)
			);

			IF OBJECT_ID ('stg.Sprint_Race_Results', 'U') IS NOT NULL
				DROP TABLE stg.Sprint_Race_Results;
			CREATE TABLE stg.Sprint_Race_Results(
				rr_resultsId INT,
				rr_raceId INT,
				rr_driverId INT,
				rr_constructorId INT,
				rr_number INT,
				rr_grid INT,
				rr_position INT,
				rr_points INT,
				rr_laps INT,
				rr_time NVARCHAR(100),
				rr_milliseconds INT,
				rr_fastestLap NVARCHAR(100),
				rr_fastestLapTime NVARCHAR(100),
				rr_statusId INT
			);

			IF OBJECT_ID ('stg.Team_Details', 'U') IS NOT NULL
				DROP TABLE stg.Team_Details;
			CREATE TABLE stg.Team_Details(
				td_constructorId INT,
				td_constructorRef NVARCHAR(100),
				td_name NVARCHAR(100),
				td_nationality NVARCHAR(100),
				td_url NVARCHAR(500)
			);

			IF OBJECT_ID ('stg.Track_Information', 'U') IS NOT NULL
				DROP TABLE stg.Track_Information;
			CREATE TABLE stg.Track_Information(
				ti_circuitId INT,
				ti_circuitRef NVARCHAR(100),
				ti_name NVARCHAR(200),
				ti_location NVARCHAR(100),
				ti_country NVARCHAR(100),
				ti_lat DECIMAL(10,6),
				ti_lng DECIMAL(10,6),
				ti_alt INT
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

DROP DATABASE IF EXISTS [SQL_COURSE];
GO

CREATE DATABASE [SQL_COURSE];
GO

USE [SQL_COURSE];
GO

/************************ CATALOG TABLES ***********************/
CREATE TABLE [person_types](
	[id_person_types]	int identity(1,1)
	,[person_type]		nvarchar(80)
);

CREATE TABLE [vehicle_types] (
	[id_vehicle_type]	int identity(1,1)
	,[vehicle_type]		nvarchar(80)
);

CREATE TABLE [transimission_type] (
	[id_transimission_type]	int identity(1,1)
	,[transimission_type]	nvarchar(80)
);

CREATE TABLE [energy_types] (
	[id_energy_type]	int identity(1,1)
	,[energy_type]		nvarchar(80)
);

CREATE TABLE [marks] (
	[id_mark]	int identity(1,1)
	,[mark]		nvarchar(80)
);

CREATE TABLE [models] (
	[id_model]		int identity(1,1)
	,[model]		nvarchar(80)
	,[fk_id_mark]	int --fk
);
--************************************************************/
/************************ ENTITY TABLES ***********************/
CREATE TABLE [persons] (
	[id_person]				bigint identity(1,1)
	,[name]					nvarchar(80)
	,[lastname_1]			nvarchar(80)
	,[lastname_2]			nvarchar(80)
	,[dob]					date
	,[sex]					bit
	,[email]				nvarchar(80)
	,[fk_id_person_type]	int		--fk	
);

CREATE TABLE [phones] (
	[id_phone]		int identity(1,1)
	,[phone]		int
	,[fk_id_person]	bigint --fk
);

CREATE TABLE [vehicles] (
	[id_vhicle]					int identity(1,1)
	,[vin]						nvarchar(80)
	,[km]						int
	,[year]						date
	,[color]					nvarchar(80)
	,[motor_num]				nvarchar(80)
	,[id_mark]					int --fk
	,[fk_id_vehicle_type]		int --fk
	,[fk_id_transimission_type]	int --fk
	,[fk_id_energy_type]		int --fk
);
--************************************************************/
/************************ TRANSACTION TABLES ***********************/
CREATE TABLE [rents] (
	[id_rent]		int identity(1,1)
	,[rent_date]	date
	,[fk_id_person]	bigint	--fk
	,[fk_id_vhicle]	int	--fk
)
--************************************************************/

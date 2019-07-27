USE [master]
GO

-- CLEAR DB IF EXISTS
DROP DATABASE IF EXISTS [CVP Cars Rental];
GO

-- CREATE NEW DATABASE
CREATE DATABASE [CVP Cars Rental];
GO 

-- SELECT DATABASE
USE [CVP Cars Rental];
GO

-- CREATE TABLES
/************************ CATALOG TABLES ***********************/
CREATE TABLE [CVP Cars Rental].[dbo].[person_types](
	[id_person_type]	int primary key identity(101,1)
	,[person_type]		nvarchar(80) not null
);

CREATE TABLE [CVP Cars Rental].[dbo].[transmission_types] (
	[id_transmission_type]	int primary key identity(101,1)
	,[transmission_type]	nvarchar(80) not null
);

CREATE TABLE [CVP Cars Rental].[dbo].[vehicle_types] (
	[id_vehicle_type]	int primary key identity(101,1)
	,[vehicle_type]		nvarchar(80) not null unique
);

CREATE TABLE [CVP Cars Rental].[dbo].[energy_types] (
	[id_energy_type]	int primary key identity(101,1)
	,[energy_type]		nvarchar(80) not null unique
);

CREATE TABLE [CVP Cars Rental].[dbo].[marks] (
	[id_mark]	int primary key identity(101,1)
	,[mark]		nvarchar(80) not null unique
);

CREATE TABLE [CVP Cars Rental].[dbo].[models] (
	[id_model]		int primary key identity(101,1)
	,[model]		nvarchar(80) not null
	,[fk_id_mark]	int foreign key references [CVP Cars Rental].[dbo].[marks]([id_mark]) not null 
);

CREATE TABLE [CVP Cars Rental].[dbo].[countries] (
	[id_country]	int primary key identity(101,1)
	,[counrty]		nvarchar(80) not null 
);

CREATE TABLE [CVP Cars Rental].[dbo].[positions] (
	[id_position]	int primary key identity(101,1)
	,[position]		nvarchar(80)
	,[salary]		int not null 
);

CREATE TABLE [CVP Cars Rental].[dbo].[issues] (
	[id_issue]	int primary key identity(101,1)
	,[issue]	nvarchar(80) not null 
);

CREATE TABLE [CVP Cars Rental].[dbo].[provinces] (
	[id_province]		int primary key identity(101,1)
	,[province]		nvarchar(80) not null
	,[fk_id_country]	int foreign key references [CVP Cars Rental].[dbo].[countries]([id_country]) not null 
);

CREATE TABLE [CVP Cars Rental].[dbo].[cantons] (
	[id_canton]		int primary key identity(101,1)
	,[canton]		nvarchar(80) not null
	,[fk_id_province]	int foreign key references [CVP Cars Rental].[dbo].[provinces]([id_province]) not null 
);

CREATE TABLE [CVP Cars Rental].[dbo].[districts] (
	[id_district]		int primary key identity(101,1)
	,[district]		nvarchar(80) not null
	,[fk_id_canton]	int foreign key references [CVP Cars Rental].[dbo].[cantons]([id_canton]) not null 
);


--************************************************************/
/************************ ENTITY TABLES ***********************/
CREATE TABLE [CVP Cars Rental].[dbo].[persons] (
	[id_person]				bigint primary key identity(101,1)
	,[name]					nvarchar(80) not null
	,[last_name]			nvarchar(80) not null
	,[dob]					date not null
	,[sex]					bit not null
	,[email]				nvarchar(80)
	,[address]				nvarchar(200)
	,[fk_id_district]		int	foreign key references [CVP Cars Rental].[dbo].[districts]([id_district]) not null
	,[fk_id_person_type]	int	foreign key references [CVP Cars Rental].[dbo].[person_types]([id_person_type]) not null
);

CREATE TABLE [CVP Cars Rental].[dbo].[phones] (
	[id_phone]		int primary key identity(101,1)
	,[phone]		int not null
	,[fk_id_person]	bigint foreign key references [CVP Cars Rental].[dbo].[persons]([id_person]) not null
);

CREATE TABLE [CVP Cars Rental].[dbo].[vehicles] (
	[id_vehicle]				int primary key identity(101,1)
	,[vin]						nvarchar(80) not null
	,[km]						int not null
	,[year]						date not null
	,[color]					nvarchar(80)
	,[chasis_num]				nvarchar(80) not null
	,[ensurance_type]			nvarchar(80) not null
	,[fk_id_vehicle_type]		int foreign key references [CVP Cars Rental].[dbo].[vehicle_types]([id_vehicle_type]) not null
	,[fk_id_transmission_type]	int foreign key references [CVP Cars Rental].[dbo].[transmission_types]([id_transmission_type]) not null
	,[fk_id_energy_type]		int foreign key references [CVP Cars Rental].[dbo].[energy_types]([id_energy_type]) not null
	,[fk_id_model]				int foreign key references [CVP Cars Rental].[dbo].[models]([id_model]) not null
);

CREATE TABLE [CVP Cars Rental].[dbo].[employees] (
	[id_employee]		int primary key identity(101,1)
	,[hire_date]		date not null
	,[status]			bit not null
	,[vaction_earned]	int not null
	,[fk_id_person]		bigint foreign key references [CVP Cars Rental].[dbo].[persons]([id_person]) not null
	,[fk_id_position]	int foreign key references [CVP Cars Rental].[dbo].[positions]([id_position]) not null
	,[manager]			int foreign key references  [CVP Cars Rental].[dbo].[employees]([id_employee])
);
--************************************************************/
/************************ BRIDGE TABLES **********************/
CREATE TABLE [CVP Cars Rental].[dbo].[vehicle-issues] (
	[id_vehicle-issues]	int primary key identity(101,1)
	,[status]			bit not null
	,[notes]			nvarchar(max)
	,[fk_id_vehicle]	int foreign key references [CVP Cars Rental].[dbo].[vehicles]([id_vehicle]) not null
	,[fk_id_issue]		int foreign key references [CVP Cars Rental].[dbo].[issues]([id_issue]) not null
)
--************************************************************/
/************************ TRANSACTION TABLES ***********************/
CREATE TABLE [CVP Cars Rental].[dbo].[rents] (
	[id_rent]		int primary key identity(101,1)
	,[rent_date]	date not null
	,[days]			int not null
	,[km_start]		int not null
	,[client]	bigint foreign key references [CVP Cars Rental].[dbo].[persons]([id_person]) not null
	,[fk_id_employee]	int foreign key references [CVP Cars Rental].[dbo].[employees]([id_employee]) not null
	,[fk_id_vhicle]	int foreign key references [CVP Cars Rental].[dbo].[vehicles]([id_vehicle]) not null
)

CREATE TABLE [CVP Cars Rental].[dbo].[vacations] (
	[id_rent]			int primary key identity(101,1)
	,[approval_date]	date not null
	,[effective_date]	date not null
	,[days]				int not null
	,[employee]			int foreign key references [CVP Cars Rental].[dbo].[employees]([id_employee]) not null
	,[approved_by]		int foreign key references [CVP Cars Rental].[dbo].[employees]([id_employee]) not null
)
--************************************************************/

USE [master]
GO

-- CLEAR DB IF EXISTS
DROP DATABASE IF EXISTS [RENTACAR];
GO

-- CREATE NEW DATABASE
CREATE DATABASE [RENTACAR];
GO 

-- SELECT DATABASE
USE [RENTACAR];
GO

-- CREATE NEW SCHEMAS
CREATE SCHEMA [catalog]
GO
CREATE SCHEMA [entities]
GO
CREATE SCHEMA [transactions]
GO

-- CREATE TABLES
/************************ CATALOG TABLES ***********************/
CREATE TABLE [RENTACAR].[catalog].[person_types](
	[id_person_type]	int primary key identity(101,1)
	,[person_type]		nvarchar(80) not null
);

CREATE TABLE [RENTACAR].[catalog].[transmission_types] (
	[id_transmission_type]	int primary key identity(101,1)
	,[transmission_type]	nvarchar(80) not null
);

CREATE TABLE [RENTACAR].[catalog].[vehicle_types] (
	[id_vehicle_type]	int primary key identity(101,1)
	,[vehicle_type]		nvarchar(80) not null unique
);

CREATE TABLE [RENTACAR].[catalog].[energy_types] (
	[id_energy_type]	int primary key identity(101,1)
	,[energy_type]		nvarchar(80) not null unique
);

CREATE TABLE [RENTACAR].[catalog].[marks] (
	[id_mark]	int primary key identity(101,1)
	,[mark]		nvarchar(80) not null unique
);

CREATE TABLE [RENTACAR].[catalog].[models] (
	[id_model]		int primary key identity(101,1)
	,[model]		nvarchar(80) not null
	,[fk_id_mark]	int foreign key references [RENTACAR].[catalog].[marks]([id_mark]) not null 
);
--************************************************************/
/************************ ENTITY TABLES ***********************/
CREATE TABLE [RENTACAR].[entities].[persons] (
	[id_person]				bigint primary key identity(101,1)
	,[name]					nvarchar(80) not null
	,[lastname_1]			nvarchar(80) not null
	,[lastname_2]			nvarchar(80)
	,[dob]					date not null
	,[sex]					bit not null
	,[email]				nvarchar(80)
	,[fk_id_person_type]	int	foreign key references [RENTACAR].[catalog].[person_types]([id_person_type]) not null
);

CREATE TABLE [RENTACAR].[entities].[phones] (
	[id_phone]		int primary key identity(101,1)
	,[phone]		int not null
	,[fk_id_person]	bigint foreign key references [RENTACAR].[entities].[persons]([id_person]) not null
);

CREATE TABLE [RENTACAR].[entities].[vehicles] (
	[id_vehicle]				int primary key identity(101,1)
	,[vin]						nvarchar(80) not null
	,[km]						int not null
	,[year]						date not null
	,[color]					nvarchar(80)
	,[motor_num]				nvarchar(80) not null
	,[fk_id_vehicle_type]		int foreign key references [RENTACAR].[catalog].[vehicle_types]([id_vehicle_type]) not null
	,[fk_id_transmission_type]	int foreign key references [RENTACAR].[catalog].[transmission_types]([id_transmission_type]) not null
	,[fk_id_energy_type]		int foreign key references [RENTACAR].[catalog].[energy_types]([id_energy_type]) not null
	--,[fk_id_mark]				int foreign key references [RENTACAR].[catalog].[marks]([id_mark]) not null
	,[fk_id_model]				int foreign key references [RENTACAR].[catalog].[models]([id_model]) not null
);
--************************************************************/
/************************ TRANSACTION TABLES ***********************/
CREATE TABLE [RENTACAR].[transactions].[rents] (
	[id_rent]		int primary key identity(101,1)
	,[rent_date]	date not null
	,[fk_id_person]	bigint foreign key references [RENTACAR].[entities].[persons]([id_person]) not null
	,[fk_id_vhicle]	int foreign key references [RENTACAR].[entities].[vehicles]([id_vehicle]) not null
)
--************************************************************/


/************************ AUXILIARY TABLES ***********************/
USE [RENTACAR]
GO

DROP TABLE IF EXISTS [RENTACAR].[entities].[persona1];
DROP TABLE IF EXISTS [RENTACAR].[entities].[M_C];
GO

CREATE TABLE [RENTACAR].[entities].[persona1](
	[id_persona]	int	primary key
	,[nombre]		nvarchar(50) not null
);
GO

CREATE TABLE [RENTACAR].[entities].[M_C](
	[id_m_c]			int primary key
	,[telefono]			nvarchar(15) not null
	,[fk_id_persona]	int not null
);
GO

ALTER TABLE [RENTACAR].[entities].[M_C]
ADD CONSTRAINT [fk_m_c_persona1] FOREIGN KEY ([fk_id_persona]) REFERENCES [RENTACAR].[entities].[persona1] ([id_persona])
--************************************************************/
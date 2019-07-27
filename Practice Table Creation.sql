USE [master]
GO

-- CLEAR DB IF EXISTS
DROP DATABASE IF EXISTS [LIBRARY];
GO

-- CREATE NEW DATABASE
CREATE DATABASE [LIBRARY];
GO 

-- SELECT DATABASE
USE [LIBRARY];
GO

-- CREATE NEW SCHEMAS
--CREATE SCHEMA [dbo]
--GO
--CREATE SCHEMA [dbo]
--GO
--CREATE SCHEMA [transactions]
--GO

-- CREATE TABLES
/************************ CATALOG TABLES ***********************/
CREATE TABLE [LIBRARY].[dbo].[person_types](
	[id]			int primary key identity(101,1)
	,[person_type]	nvarchar(80) not null unique
);

CREATE TABLE [LIBRARY].[dbo].[geneders] (
	[id]		int primary key identity(101,1)
	,[geneder]	nvarchar(80) not null unique
);

CREATE TABLE [LIBRARY].[dbo].[countries] (
	[id]			int primary key identity(101,1)
	,[country]		nvarchar(80) not null unique
);

CREATE TABLE [LIBRARY].[dbo].[transaction_types] (
	[id]					int primary key identity(101,1)
	,[transaction_type]		nvarchar(80) not null unique
	,[sell_cost]			float
	,[days]					smallint
);
--************************************************************/
/************************ ENTITY TABLES ***********************/
CREATE TABLE [LIBRARY].[dbo].[persons] (
	[id]			bigint primary key identity(101,1)
	,[name]			nvarchar(80) not null
	,[last_name]	nvarchar(80) not null
	,[email]		nvarchar(80)
	,[address]		nvarchar(max)
	,[person_type]	int	foreign key references [LIBRARY].[dbo].[person_types]([id]) not null
);

CREATE TABLE [LIBRARY].[dbo].[editorials] (
	[id]			int primary key identity(101,1)
	,[editorial]	varchar(50)	
	,[country]		bigint foreign key references [LIBRARY].[dbo].[countries]([id]) not null
);

CREATE TABLE [LIBRARY].[dbo].[phones] (
	[id]		int primary key identity(101,1)
	,[phone]	int not null
	,[notes]	nvarchar(200)
	,[person]	bigint foreign key references [LIBRARY].[dbo].[persons]([id]) not null
);

CREATE TABLE [LIBRARY].[dbo].[books] (
	[id]			bigint primary key identity(101,1)
	,[title]		nvarchar(200) not null
	,[year]			int not null
	,[status]		bit not null
	,[quatity]		int not null
	,[editorial]	int foreign key references [LIBRARY].[dbo].[editorials]([id]) not null
	,[gender]		int foreign key references [LIBRARY].[dbo].[geneders]([id]) not null
	,[country]		int foreign key references [LIBRARY].[dbo].[countries]([id]) not null
);
--************************************************************/
/************************ TRANSACTION TABLES ***********************/
CREATE TABLE [LIBRARY].[dbo].[transactions] (
	[id]				bigint primary key identity(101,1)
	,[date]				date not null
	,[employee]			bigint foreign key references [LIBRARY].[dbo].[persons]([id]) not null
	,[client]			bigint foreign key references [LIBRARY].[dbo].[persons]([id]) not null
)
--************************************************************/
/************************ TRANSISIONAL TABLES ***********************/
CREATE TABLE [LIBRARY].[dbo].[books-genders] (
	[id]				bigint primary key identity(101,1)
	,[book]				bigint foreign key references [LIBRARY].[dbo].[books]([id]) not null
	,[gender]			bigint foreign key references [LIBRARY].[dbo].[geneders]([id]) not null
);

CREATE TABLE [LIBRARY].[dbo].[books-transactions] (
	[id]				bigint primary key identity(101,1)
	,[book]				bigint foreign key references [LIBRARY].[dbo].[books]([id]) not null
	,[transaction]		bigint foreign key references [LIBRARY].[dbo].[transactions]([id]) not null
	,[transaction_type]	bigint foreign key references [LIBRARY].[dbo].[transaction_types]([id]) not null
)
--************************************************************/
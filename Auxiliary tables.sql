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
)
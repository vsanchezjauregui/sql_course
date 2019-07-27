--USE [master]
USE [RENTACAR];
GO

SELECT * FROM [RENTACAR].[catalog].[marks]
-- * shows all the columns

SELECT [mark] FROM [RENTACAR].[catalog].[marks]
SELECT [id_mark] FROM [RENTACAR].[catalog].[marks]
-- Shows only the specified columns

SELECT 
	* 
FROM 
	[RENTACAR].[catalog].[marks]
WHERE
	[id_mark] = 5
-- Shows only the record where id_mark is equals to 5

SELECT 
	T1.[id_model]
	,T1.[model]
	,T2.[id_mark]
	,T2.[mark]
FROM 
	[RENTACAR].[catalog].[models] T1 WITH(NOLOCK)
INNER JOIN
	[RENTACAR].[catalog].[marks] T2 WITH(NOLOCK)
		ON T2.[id_mark] = T1.[fk_id_mark]

SELECT 
	T1.[id_model]
	,T1.[model]
	,T2.[id_mark]
	,T2.[mark]
FROM 
	[RENTACAR].[catalog].[models] T1 WITH(NOLOCK)
LEFT JOIN
	[RENTACAR].[catalog].[marks] T2 WITH(NOLOCK)
		ON T2.[id_mark] = T1.[fk_id_mark]

SELECT 
	--T1.[id_model]
	T1.[model]
	--,T2.[id_mark]
	,T2.[mark]
FROM 
	[RENTACAR].[catalog].[models] T1 WITH(NOLOCK)
RIGHT JOIN
	[RENTACAR].[catalog].[marks] T2 WITH(NOLOCK)
		ON T2.[id_mark] = T1.[fk_id_mark]
WHERE
	T1.[model] IS NULL

SELECT 
	[full_name]			= T1.[name] + ' ' + t1.[lastname_1] + ' ' + t1.[lastname_2]
	,[date_of_birth]	= T1.[dob]
	,[sex]				= CASE WHEN T1.[sex] = 1 THEN 'Masculino' ELSE 'Femenino' END
	,T1.[email]
	,t2.[person_type]
FROM 
	[RENTACAR].[entities].[persons] T1 WITH(NOLOCK)
--INNER JOIN
	,[RENTACAR].[catalog].[person_types] T2 WITH(NOLOCK)
		--ON T2.[id_person_type] = T1.[fk_id_person_type]
WHERE 
	MONTH(T1.[dob]) = 8



SELECT 
	V.[id_vehicle]
	,V.[vin]
	,ET.[id_energy_type]
	,ET.[energy_type]
FROM
	[RENTACAR].[entities].[vehicles] V
	INNER JOIN [RENTACAR].[catalog].[energy_types] ET
		ON V.[fk_id_energy_type] = ET.[id_energy_type]


		
SELECT 
	V.[id_vehicle]
	,V.[vin]
	,VT.[id_vehicle_type]
	,VT.[vehicle_type]
FROM
	[RENTACAR].[entities].[vehicles] V
	INNER JOIN [RENTACAR].[catalog].[vehicle_types] VT
		ON V.[fk_id_vehicle_type] = VT.[id_vehicle_type]

				
SELECT 
	V.[id_vehicle]
	,TT.[transmission_type]
	,ET.[energy_type]
FROM
	[RENTACAR].[entities].[vehicles] V
	INNER JOIN [RENTACAR].[catalog].[transmission_types] TT
		ON V.[fk_id_transmission_type] = TT.[id_transmission_type]
	INNER JOIN [RENTACAR].[catalog].[energy_types] ET
		ON V.[fk_id_energy_type] = ET.[id_energy_type]

		
SELECT
	t1.[id_vehicle]
	,t1.[vin]
	,t2.[id_mark]
	,t2.[mark]
	,t3.[id_model]
	,t3.[model]
FROM 
	[RENTACAR].[entities].[vehicles] T1
inner join
	rentacar.[catalog].[models] t3
		on t1.[fk_id_model] = t3.id_model
inner join
	[rentacar].[catalog].[marks] t2
		on t3.[fk_id_mark] = t2.[id_mark]
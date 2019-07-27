USE [master]
BEGIN TRANSACTION --ROLLBACK COMMIT
/************ MARKS *******************************/
INSERT INTO [RENTACAR].[catalog].[marks] ([mark]) VALUES 
	('Honda')
	,('Toyota')
	,('Nissan')
	,('Fiat')
	,('Mitsubishi')
	,('Suzuki')
	,('BMW')
	,('Mercedes Benz')
	,('Volkswagen')
	,('Land Rover')

--SELECT * FROM [RENTACAR].[catalog].[marks] ORDER BY 1
--*******************************************/
/************ VEHICLE TYPES *******************************/
INSERT INTO [RENTACAR].[catalog].[vehicle_types]([vehicle_type]) VALUES
	('4WD')
	,('Sedan')
	,('Hatchback')
	,('Coupe')
	,('Motorcyle')
	,('Microbus')
	,('Trailer')
	,('SUV')
	,('Crossover')
	,('Convertible')

--SELECT * FROM [RENTACAR].[catalog].[vehicle_types] ORDER BY 1
--*******************************************/
/************ ENERGY TYPES *******************************/
INSERT INTO [RENTACAR].[catalog].[energy_types]([energy_type]) VALUES
	('Gas')
	,('Oil')
	,('Diesel')
	,('Electicity')
	,('Hybrid')

--SELECT * FROM [RENTACAR].[catalog].[energy_types] ORDER BY 1
--*******************************************/
/************ MODELS *******************************/
INSERT INTO [RENTACAR].[catalog].[models] ([model],[fk_id_mark]) VALUES
	('CRV', 101)
	,('Acord',101)
	,('Civic',101)
	,('Fit',101)
	,('Prado',102)
	,('Corolla',102)
	,('Yaris',102)
	,('Prius',102)
	--,('Pathfinder',103)
	--,('Patrol',103)
	--,('Sentra',103)
	--,('Micra',103)
	--,('Uno',104)
	--,('500',104)
	--,('Bravo',104)
	--,('Ducato',104)
	--,('Lancer',105)
	,('Mirage',105)
	,('Outlander',105)
	,('Montero',105)
	,('Atos',106)
	,('Ciaz',106)
	,('Swift',106)
	,('Vitara',106)
	,('i3',107)
	,('M4',107)
	,('M3',107)
	,('M5',107)
	,('Citan',108)
	,('GLA',108)
	,('Class A',108)
	,('Class B',108)
	,('Beatle',109)
	,('New Beatle',109)
	,('Polo',109)
	,('Jeta',109)
	,('Evoque',110)
	,('Discovery',110)
	,('Velar',110)
	,('LWB',110)
	
--SELECT * FROM [RENTACAR].[catalog].[models] ORDER BY 1
--*******************************************/
/************ PERSONS TYPE *******************************/
INSERT INTO [RENTACAR].[catalog].[person_types] ([person_type]) VALUES
	('Empleado')
	,('Cliente')
	,('Proveedor')
	,('Empleado')
	,('Cliente - Empleado')
	,('Proveedor - Cliente')

--SELECT * FROM [RENTACAR].[catalog].[person_types] ORDER BY 1
--*******************************************/
/************ PERSONS *******************************/
INSERT INTO [RENTACAR].[entities].[persons] (
	[name]
	,[lastname_1]
	,[lastname_2]
	,[dob]
	,[sex]
	,[email]
	,[fk_id_person_type]
) VALUES
	('Victor','Sanchez','Jauregui','1990-01-31',1,'plover@gmail.com',101)
	,('William','Medina','Cienfuegos','1995-05-26',1,'kaiser@optonline.net',101)
	,('Cecilia','Oliva','Mujica','1987-12-30',0,'hachi@outlook.com',102)
	,('Luis','Velez','Calderon','1993-04-04',1,'fmerges@mac.com',104)
	,('Claudia','Hernandez','Turcios','1990-08-20',0,'jmgomez@outlook.com',105)
	,('Jose','Zaldana','Viquez','1983-01-24',1,'mstrout@yahoo.ca',106)
	--,('Salvador','Fuentes','Martinez','1983-06-03',1,'mnemonic@gmail.com',103)
	,('Francisco','Serrano','Lopez','1986-06-16',1,'howler@me.com',102)
	,('Marlon','Guevara','Santos','1988-03-10',1,'haddawy@hotmail.com',102)
	,('Joaquin','Martinez','Perez','1989-01-03',1,'cantu@msn.com',102)
	,('Dayana','Saborio','Vargas','1991-03-25',0,'hstiles@gmail.com',102)
	,('Elena','Perez','Herrera','1991-09-03',0,'cparis@att.net',102)
	,('Fernanda','Fallas','Rojas','1991-11-25',0,'bolow@me.com',102)
	--,('Monica','Estrada','Saborio','1992-02-07',0,'aegreene@mac.com',103)
	,('Josue','Rojas','Abarca','1992-06-15',1,'denton@yahoo.com',104)
	,('Carlos','Vilchez','Jimenez','1995-01-05',1,'matsn@optonline.net',105)
	,('Pablo','Mata','Granados','1995-12-18',1,'ozawa@gmail.com',106)
	,('Hazel','Mena','Mora','1997-03-05',0,'schwaang@aol.com',101)
	,('Alejandra','Parra','Sanchez','1999-10-14',0,'jespley@optonline.net',102)
	--,('Angel','Lopez','Fernandez','2000-08-07',1,'doormat@icloud.com',103)
	,('Isaac','Guevara','Jimenez','1995-12-18',1,'zavadsky@comcast.net',104)
	
--SELECT * FROM [RENTACAR].[entities].[persons] ORDER BY 2
--*******************************************/
/************ TRANSMISSION TYPE *******************************/
INSERT INTO [RENTACAR].[catalog].[transmission_types] ([transmission_type]) VALUES
	('Manual')
	,('Automatica')
	,('Secuencial')
	,('CTV')

--SELECT * FROM [RENTACAR].[catalog].[transmission_types] ORDER BY 1
--*******************************************/
/************ TRANSMISSION TYPE *******************************/
INSERT INTO [RENTACAR].[entities].[vehicles] (
	[vin]		
	,[km]		
	,[year]		
	,[color]	
	,[motor_num]
	,[fk_id_vehicle_type]		
	,[fk_id_transmission_type]	
	,[fk_id_energy_type]		
	,[fk_id_model]
	--,[fk_id_mark]				
)
VALUES 
--('NJHZK4PRJGJI6DWQ5',77816,'2014-01-01','Deep Pink',563808706,105,103,105,107)
--,('TQR0JW04VRK61W4T2',89689,'2011-01-01','Khaki',857161677,108,104,101,105)
--,('O7YYWG55JARTJ0V7S',58220,'2016-01-01','Salmon',275840749,103,103,105,105)
--,('9ST10RC860LUWD01W',64862,'2010-01-01','Orange',900690362,102,103,105,110)
--,('6LDYI7R809NEPE7FK',73445,'2016-01-01','Medium Slate Blue',353847028,107,101,101,108)
--,('E6ISLJSERRUJLFYKI',10604,'2014-01-01','Lemon Chiffon',866518217,108,104,102,106)
--,('5UTUMB5N9Q5JJM9KR',21854,'2012-01-01','White',366992672,110,103,105,110)
--,('2MILEQB0HNIIGN3SP',36090,'2018-01-01','Dark Orchid',845775902,103,102,101,107)
--,('1JI68K34OI0LS3MZB',84278,'2014-01-01','Steel Blue',654264006,103,104,101,110)
--,('Z67SQNOGO6B4IVNCC',48822,'2013-01-01','Dark Gray',562080761,105,101,101,104)
--,('94D122RDCX34IP77B',71671,'2017-01-01','Fire Brick',383725242,108,104,102,103)
--,('7SHENR3AO8TIUBV3U',77473,'2014-01-01','Dark Red',966670943,101,102,101,102)
--,('D6K9JEAVG1UT7EKPU',70250,'2010-01-01','Sea Green',816612325,103,101,102,103)
--,('945N7GKXNJ3VPMHIZ',96694,'2019-01-01','Orange Red',933613522,101,104,105,109)
--,('FY98RMTV4NSJGPUPV',17711,'2013-01-01','Light Salmon',956082410,105,103,104,110)
--,('6GPC38ZV1SAA56BCG',82461,'2010-01-01','Sky Blue',631307767,101,104,105,107)
--,('EZCL6LK7QQWOER7BP',74910,'2018-01-01','Dark Olive Green',733568597,101,102,101,102)
--,('Y17NFTLD6GX34Z1EH',63864,'2012-01-01','Antique White',712642855,101,104,102,101)
--,('JJ91HVG5DAR70SX3K',91659,'2018-01-01','Chocolate',549014982,102,104,102,109)
--,('9J1IQJ8P8OBN517G0',10329,'2019-01-01','Dark Green',260535057,101,104,104,106)
--,('A2AG91KY9E8MK87VI',56610,'2016-01-01','Navy',779309441,105,102,101,103)
--,('3FLIXBP1TJ3TJDXXN',49645,'2012-01-01','Tan',776427349,103,101,103,101)





	('NJHZK4PRJGJI6DWQ5',77816,'2014-01-01','Deep Pink',563808706,105,103,105,129)
	,('TQR0JW04VRK61W4T2',89689,'2011-01-01','Khaki',857161677,108,104,101,108)
	,('O7YYWG55JARTJ0V7S',58220,'2016-01-01','Salmon',275840749,103,103,105,130)
	,('9ST10RC860LUWD01W',64862,'2010-01-01','Orange',900690362,102,103,105,118)
	,('6LDYI7R809NEPE7FK',73445,'2016-01-01','Medium Slate Blue',353847028,107,101,101,116)
	,('E6ISLJSERRUJLFYKI',10604,'2014-01-01','Lemon Chiffon',866518217,108,104,102,107)
	,('5UTUMB5N9Q5JJM9KR',21854,'2012-01-01','White',366992672,110,103,105,125)
	,('2MILEQB0HNIIGN3SP',36090,'2018-01-01','Dark Orchid',845775902,103,102,101,121)
	,('1JI68K34OI0LS3MZB',84278,'2014-01-01','Steel Blue',654264006,103,104,101,111)
	,('Z67SQNOGO6B4IVNCC',48822,'2013-01-01','Dark Gray',562080761,105,101,101,116)
	,('94D122RDCX34IP77B',71671,'2017-01-01','Fire Brick',383725242,108,104,102,104)
	,('7SHENR3AO8TIUBV3U',77473,'2014-01-01','Dark Red',966670943,101,102,101,109)
	,('D6K9JEAVG1UT7EKPU',70250,'2010-01-01','Sea Green',816612325,103,101,102,126)
	,('945N7GKXNJ3VPMHIZ',96694,'2019-01-01','Orange Red',933613522,101,104,105,122)
	,('FY98RMTV4NSJGPUPV',17711,'2013-01-01','Light Salmon',956082410,105,103,104,113)
	,('6GPC38ZV1SAA56BCG',82461,'2010-01-01','Sky Blue',631307767,101,104,105,115)
	,('EZCL6LK7QQWOER7BP',74910,'2018-01-01','Dark Olive Green',733568597,101,102,101,103)
	,('Y17NFTLD6GX34Z1EH',63864,'2012-01-01','Antique White',712642855,101,104,102,118)
	,('JJ91HVG5DAR70SX3K',91659,'2018-01-01','Chocolate',549014982,102,104,102,104)
	,('9J1IQJ8P8OBN517G0',10329,'2019-01-01','Dark Green',260535057,101,104,104,118)
	,('A2AG91KY9E8MK87VI',56610,'2016-01-01','Navy',779309441,105,102,101,117)
	,('3FLIXBP1TJ3TJDXXN',49645,'2012-01-01','Tan',776427349,103,101,103,120)


--SELECT * FROM [RENTACAR].[entities].[vehicles] ORDER BY 1
--*******************************************/



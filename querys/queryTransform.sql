DELETE FROM [TFG].[dbo].[comercios_alimentos] WHERE comal_descripcion = ''

UPDATE a
SET a.comal_precio = null
   ,a.comal_cantidad = null
   ,a.comal_cantidad_peso = null
   ,a.comal_medida = null
   ,a.comal_peso_medida = null
   ,a.comal_peso_precio = null
FROM [TFG].[dbo].[comercios_alimentos] a

UPDATE a
SET a.comal_nombre = SUBSTRING(comal_descripcion, 0, CHARINDEX(' ', comal_descripcion))
FROM [TFG].[dbo].[comercios_alimentos] a

UPDATE a
SET a.comal_nombre = REPLACE(a.comal_nombre, '"', '')
FROM [TFG].[dbo].[comercios_alimentos] a

UPDATE a
SET a.comal_descripcion = REPLACE(a.comal_descripcion, '"', '')
FROM [TFG].[dbo].[comercios_alimentos] a

UPDATE a
SET a.commar_id = 1
FROM [TFG].[dbo].[comercios_alimentos] a
WHERE a.commar_id is null

UPDATE a
SET a.comal_precio = CONVERT(decimal(10, 2), REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(a.comal_precio_desc, ',', ''), '$', ''), ' x un.', ''), ' x kg.', ''), ' ', ''))
FROM [TFG].[dbo].[comercios_alimentos] a
WHERE ISNUMERIC(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(a.comal_precio_desc, ',', ''), '$', ''), ' x un.', ''), ' x kg.', ''), ' ', '')) = 1

UPDATE a
SET a.comal_precio = CONVERT(decimal(10, 2), REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(SUBSTRING(a.comal_precio_desc, 0, CHARINDEX('antes', a.comal_precio_desc)), ',', ''), '$', ''), ' x un.', ''), ' x kg.', ''), ' ', ''))
FROM [TFG].[dbo].[comercios_alimentos] a
WHERE a.comal_precio is null
AND ISNUMERIC(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(SUBSTRING(a.comal_precio_desc, 0, CHARINDEX('antes', a.comal_precio_desc)), ',', ''), '$', ''), ' x un.', ''), ' x kg.', ''), ' ', '')) = 1

UPDATE a
SET a.comal_cantidad = 1
FROM [TFG].[dbo].[comercios_alimentos] a
WHERE a.[comal_precio_desc] like '% x un.%'

UPDATE a
SET a.comal_cantidad_peso = 1
FROM [TFG].[dbo].[comercios_alimentos] a

UPDATE a
SET a.comal_cantidad = 1
FROM [TFG].[dbo].[comercios_alimentos] a
WHERE a.[comal_precio_desc] like '% x kg.%'

UPDATE a
SET a.comal_medida = 'Unidad'
FROM [TFG].[dbo].[comercios_alimentos] a
WHERE a.[comal_precio_desc] like '% x un.%'

UPDATE a
SET a.comal_medida = 'Kilogramo'
FROM [TFG].[dbo].[comercios_alimentos] a
WHERE a.[comal_precio_desc] like '% x kg.%'

UPDATE a
SET a.comal_peso_precio = CONVERT(decimal(10, 2), REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(a.comal_precio_desc, ',', ''), '$', ''), ' x Metro', ''), ' x Unidad', ''), ' x Litros', ''), ' x Kilogramo.', ''), ' x un.', ''), ' x kg.', ''), ' ', ''))
FROM [TFG].[dbo].[comercios_alimentos] a
WHERE ISNUMERIC(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(a.comal_precio_desc, ',', ''), '$', ''), ' x Metro', ''), ' x Unidad', ''), ' x Litros', ''), ' x Kilogramo.', ''), ' x un.', ''), ' x kg.', ''), ' ', '')) = 1

UPDATE a
SET a.comal_peso_precio = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(SUBSTRING(a.comal_precio_desc, 0, CHARINDEX('antes', a.comal_precio_desc)), ',', ''), '$', ''), ' x Metro', ''), ' x Unidad', ''), ' x Litros', ''), ' x Kilogramo.', ''), ' x un.', ''), ' x kg.', ''), ' ', '')
FROM [TFG].[dbo].[comercios_alimentos] a
WHERE a.comal_peso_precio is null
AND ISNUMERIC(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(SUBSTRING(a.comal_precio_desc, 0, CHARINDEX('antes', a.comal_precio_desc)), ',', ''), '$', ''), ' x Metro', ''), ' x Unidad', ''), ' x Litros', ''), ' x Kilogramo.', ''), ' x un.', ''), ' x kg.', ''), ' ', '')) = 1

UPDATE a
SET a.comal_peso_medida = REPLACE(RIGHT(a.comal_peso_precio_desc, LEN(comal_peso_precio_desc) - CHARINDEX('x', comal_peso_precio_desc)), ' ', '')
FROM [TFG].[dbo].[comercios_alimentos] a
WHERE REPLACE(RIGHT(a.comal_peso_precio_desc, LEN(comal_peso_precio_desc) - CHARINDEX('x', comal_peso_precio_desc)), ' ', '') <> ''

UPDATE a
SET a.comal_peso_medida = a.comal_medida
FROM [TFG].[dbo].[comercios_alimentos] a
where a.comal_peso_medida is null


UPDATE a
SET a.comal_tipo_oferta = 'Propia'
FROM [TFG].[dbo].[comercios_alimentos] a
WHERE a.comal_tipo_oferta = 'promotionSuperIcon'

UPDATE a
SET a.comal_tipo_oferta = 'Precios Cuidados'
FROM [TFG].[dbo].[comercios_alimentos] a
WHERE a.comal_tipo_oferta = 'promotionPreciosCuidadosIcon'

UPDATE a
SET a.comal_tipo_oferta = 'Propia'
FROM [TFG].[dbo].[comercios_alimentos] a
WHERE a.comal_oferta <> ''
and a.comal_tipo_oferta <> 'Precios Cuidados'

UPDATE a
SET a.comal_tipo_oferta = ''
FROM [TFG].[dbo].[comercios_alimentos] a
WHERE a.comal_oferta = ''
and a.comal_tipo_oferta <> 'Precios Cuidados'

UPDATE a
SET a.comal_oferta = ''
FROM [TFG].[dbo].[comercios_alimentos] a
WHERE a.comal_tipo_oferta = 'Precios Cuidados'

UPDATE a
SET a.comal_img_url = 'assets/img/MissingProduct_medium.jpg'
FROM [TFG].[dbo].[comercios_alimentos] a
WHERE a.comal_img_url like '%MissingProduct_medium.jpg%'


if object_id('tempdb..#comerciosprepo') is not null
	drop table #comerciosprepo

SELECT distinct a.comal_nombre, comal_descripcion
INTO #comerciosprepo
FROM TFG.dbo.comercios_alimentos a
    CROSS APPLY TFG.dbo.DelimitedSplit8K(comal_descripcion, ' ') d
WHERE d.Item in (select transform_prepositions_nombre
				 from TFG.dbo.transform_prepositions)
and d.ItemNumber = 2

if object_id('tempdb..#comerciosprepo1') is not null
	drop table #comerciosprepo1

SELECT distinct a.comal_descripcion, b.Item, b.ItemNumber
INTO #comerciosprepo1
FROM TFG.dbo.comercios_alimentos a
	CROSS APPLY TFG.dbo.DelimitedSplit8K(comal_descripcion, ' ') b
WHERE b.ItemNumber = 1

if object_id('tempdb..#comerciosprepo2') is not null
	drop table #comerciosprepo2

SELECT distinct a.comal_descripcion, b.Item, b.ItemNumber
INTO #comerciosprepo2
FROM TFG.dbo.comercios_alimentos a
	CROSS APPLY TFG.dbo.DelimitedSplit8K(comal_descripcion, ' ') b
WHERE b.ItemNumber = 2

if object_id('tempdb..#comerciosprepo3') is not null
	drop table #comerciosprepo3

SELECT distinct a.comal_descripcion, b.Item, b.ItemNumber
INTO #comerciosprepo3
FROM TFG.dbo.comercios_alimentos a
	CROSS APPLY TFG.dbo.DelimitedSplit8K(comal_descripcion, ' ') b
WHERE b.ItemNumber = 3


UPDATE a
SET a.comal_nombre = b.Item1 + ' ' + b.Item2 + ' ' + b.Item3
FROM TFG.dbo.comercios_alimentos a
INNER JOIN (
SELECT distinct b.*, a.Item as Item1, c.Item as Item2, d.Item as Item3
FROM
#comerciosprepo b
INNER JOIN
#comerciosprepo1 a on a.comal_descripcion = b.comal_descripcion
INNER JOIN
#comerciosprepo2 c on c.comal_descripcion = b.comal_descripcion
INNER JOIN
#comerciosprepo3 d on d.comal_descripcion = b.comal_descripcion ) b on b.comal_descripcion = a.comal_descripcion
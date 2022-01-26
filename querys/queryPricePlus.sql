--INSERT INTO [TFG].[dbo].[comercios_alimentos]
--SELECT null as [commar_id]
--      ,[comal_nombre]
--      ,[comal_descripcion]
--      ,[comal_img_url]
--      ,[comal_precio]
--      ,[comal_cantidad]
--      ,[comal_cantidad_peso]
--      ,[comal_medida]
--      ,[comal_peso_medida]
--      ,[comal_peso_precio]
--      ,[comal_precio_desc]
--      ,[comal_peso_precio_desc]
--      ,[comal_tipo_oferta]
--      ,[comal_oferta]
--FROM [TFG].[dbo].[comercios_alimentos]
--WHERE [commar_id] = 1

--SELECT CONVERT(decimal(10, 2), CONVERT(decimal(10, 2), a.comal_precio) * 1.11) as comal_precio
--	  ,CONVERT(decimal(10, 2), CONVERT(decimal(10, 2), a.comal_peso_precio) * 1.11) as comal_peso_precio
--	  ,a.comal_precio
--FROM [TFG].[dbo].[comercios_alimentos] a
--where a.commar_id is null

WITH comercios_alimentos
AS  
(  
	SELECT [comal_id]
		  ,[commar_id]
		  ,[comal_nombre]
		  ,[comal_descripcion]
		  ,[comal_img_url]
		  ,[comal_precio]
		  ,[comal_cantidad]
		  ,[comal_cantidad_peso]
		  ,[comal_medida]
		  ,[comal_peso_medida]
		  ,[comal_peso_precio]
		  ,[comal_precio_desc]
		  ,[comal_peso_precio_desc]
		  ,[comal_tipo_oferta]
		  ,[comal_oferta]
		  ,ROW_NUMBER() OVER(order by [comal_id]) row_num
	FROM [TFG].[dbo].[comercios_alimentos] a
	where a.commar_id is null
	and a.comal_tipo_oferta <> 'Precios Cuidados'
)
UPDATE a
SET a.comal_precio = CONVERT(decimal(10, 2), CONVERT(decimal(10, 2), a.comal_precio) * 1.014)
   ,a.comal_peso_precio = CONVERT(decimal(10, 2), CONVERT(decimal(10, 2), a.comal_peso_precio) * 1.014)
FROM comercios_alimentos a
WHERE a.row_num between 0 and 1065;

WITH comercios_alimentos1
AS  
(  
	SELECT [comal_id]
		  ,[commar_id]
		  ,[comal_nombre]
		  ,[comal_descripcion]
		  ,[comal_img_url]
		  ,[comal_precio]
		  ,[comal_cantidad]
		  ,[comal_cantidad_peso]
		  ,[comal_medida]
		  ,[comal_peso_medida]
		  ,[comal_peso_precio]
		  ,[comal_precio_desc]
		  ,[comal_peso_precio_desc]
		  ,[comal_tipo_oferta]
		  ,[comal_oferta]
		  ,ROW_NUMBER() OVER(order by [comal_id]) row_num
	FROM [TFG].[dbo].[comercios_alimentos] a
	where a.commar_id is null
	and a.comal_tipo_oferta <> 'Precios Cuidados'
)
UPDATE a
SET a.comal_precio = CONVERT(decimal(10, 2), CONVERT(decimal(10, 2), a.comal_precio) * 1.027)
   ,a.comal_peso_precio = CONVERT(decimal(10, 2), CONVERT(decimal(10, 2), a.comal_peso_precio) * 1.027)
FROM comercios_alimentos1 a
WHERE a.row_num between 1066 and 2130;

WITH comercios_alimentos2
AS  
(  
	SELECT [comal_id]
		  ,[commar_id]
		  ,[comal_nombre]
		  ,[comal_descripcion]
		  ,[comal_img_url]
		  ,[comal_precio]
		  ,[comal_cantidad]
		  ,[comal_cantidad_peso]
		  ,[comal_medida]
		  ,[comal_peso_medida]
		  ,[comal_peso_precio]
		  ,[comal_precio_desc]
		  ,[comal_peso_precio_desc]
		  ,[comal_tipo_oferta]
		  ,[comal_oferta]
		  ,ROW_NUMBER() OVER(order by [comal_id]) row_num
	FROM [TFG].[dbo].[comercios_alimentos] a
	where a.commar_id is null
	and a.comal_tipo_oferta <> 'Precios Cuidados'
)
UPDATE a
SET a.comal_precio = CONVERT(decimal(10, 2), CONVERT(decimal(10, 2), a.comal_precio) * 1.031)
   ,a.comal_peso_precio = CONVERT(decimal(10, 2), CONVERT(decimal(10, 2), a.comal_peso_precio) * 1.031)
FROM comercios_alimentos2 a
WHERE a.row_num between 2130 and 3195;

WITH comercios_alimentos3
AS  
(  
	SELECT [comal_id]
		  ,[commar_id]
		  ,[comal_nombre]
		  ,[comal_descripcion]
		  ,[comal_img_url]
		  ,[comal_precio]
		  ,[comal_cantidad]
		  ,[comal_cantidad_peso]
		  ,[comal_medida]
		  ,[comal_peso_medida]
		  ,[comal_peso_precio]
		  ,[comal_precio_desc]
		  ,[comal_peso_precio_desc]
		  ,[comal_tipo_oferta]
		  ,[comal_oferta]
		  ,ROW_NUMBER() OVER(order by [comal_id]) row_num
	FROM [TFG].[dbo].[comercios_alimentos] a
	where a.commar_id is null
	and a.comal_tipo_oferta <> 'Precios Cuidados'
)
UPDATE a
SET a.comal_precio = CONVERT(decimal(10, 2), CONVERT(decimal(10, 2), a.comal_precio) * 1.048)
   ,a.comal_peso_precio = CONVERT(decimal(10, 2), CONVERT(decimal(10, 2), a.comal_peso_precio) * 1.048)
FROM comercios_alimentos3 a
WHERE a.row_num between 3195 and 4260;

WITH comercios_alimentos4
AS  
(  
	SELECT [comal_id]
		  ,[commar_id]
		  ,[comal_nombre]
		  ,[comal_descripcion]
		  ,[comal_img_url]
		  ,[comal_precio]
		  ,[comal_cantidad]
		  ,[comal_cantidad_peso]
		  ,[comal_medida]
		  ,[comal_peso_medida]
		  ,[comal_peso_precio]
		  ,[comal_precio_desc]
		  ,[comal_peso_precio_desc]
		  ,[comal_tipo_oferta]
		  ,[comal_oferta]
		  ,ROW_NUMBER() OVER(order by [comal_id]) row_num
	FROM [TFG].[dbo].[comercios_alimentos] a
	where a.commar_id is null
	and a.comal_tipo_oferta <> 'Precios Cuidados'
)
UPDATE a
SET a.comal_precio = CONVERT(decimal(10, 2), CONVERT(decimal(10, 2), a.comal_precio) * 1.055)
   ,a.comal_peso_precio = CONVERT(decimal(10, 2), CONVERT(decimal(10, 2), a.comal_peso_precio) * 1.055)
FROM comercios_alimentos4 a
WHERE a.row_num between 4260 and 5325;

WITH comercios_alimentos5
AS  
(  
	SELECT [comal_id]
		  ,[commar_id]
		  ,[comal_nombre]
		  ,[comal_descripcion]
		  ,[comal_img_url]
		  ,[comal_precio]
		  ,[comal_cantidad]
		  ,[comal_cantidad_peso]
		  ,[comal_medida]
		  ,[comal_peso_medida]
		  ,[comal_peso_precio]
		  ,[comal_precio_desc]
		  ,[comal_peso_precio_desc]
		  ,[comal_tipo_oferta]
		  ,[comal_oferta]
		  ,ROW_NUMBER() OVER(order by [comal_id]) row_num
	FROM [TFG].[dbo].[comercios_alimentos] a
	where a.commar_id is null
	and a.comal_tipo_oferta <> 'Precios Cuidados'
)
UPDATE a
SET a.comal_precio = CONVERT(decimal(10, 2), CONVERT(decimal(10, 2), a.comal_precio) * 1.069)
   ,a.comal_peso_precio = CONVERT(decimal(10, 2), CONVERT(decimal(10, 2), a.comal_peso_precio) * 1.069)
FROM comercios_alimentos5 a
WHERE a.row_num between 5325 and 6390;

WITH comercios_alimentos6
AS  
(  
	SELECT [comal_id]
		  ,[commar_id]
		  ,[comal_nombre]
		  ,[comal_descripcion]
		  ,[comal_img_url]
		  ,[comal_precio]
		  ,[comal_cantidad]
		  ,[comal_cantidad_peso]
		  ,[comal_medida]
		  ,[comal_peso_medida]
		  ,[comal_peso_precio]
		  ,[comal_precio_desc]
		  ,[comal_peso_precio_desc]
		  ,[comal_tipo_oferta]
		  ,[comal_oferta]
		  ,ROW_NUMBER() OVER(order by [comal_id]) row_num
	FROM [TFG].[dbo].[comercios_alimentos] a
	where a.commar_id is null
	and a.comal_tipo_oferta <> 'Precios Cuidados'
)
UPDATE a
SET a.comal_precio = CONVERT(decimal(10, 2), CONVERT(decimal(10, 2), a.comal_precio) * 1.074)
   ,a.comal_peso_precio = CONVERT(decimal(10, 2), CONVERT(decimal(10, 2), a.comal_peso_precio) * 1.074)
FROM comercios_alimentos6 a
WHERE a.row_num between 6390 and 7455;

WITH comercios_alimentos7
AS  
(  
	SELECT [comal_id]
		  ,[commar_id]
		  ,[comal_nombre]
		  ,[comal_descripcion]
		  ,[comal_img_url]
		  ,[comal_precio]
		  ,[comal_cantidad]
		  ,[comal_cantidad_peso]
		  ,[comal_medida]
		  ,[comal_peso_medida]
		  ,[comal_peso_precio]
		  ,[comal_precio_desc]
		  ,[comal_peso_precio_desc]
		  ,[comal_tipo_oferta]
		  ,[comal_oferta]
		  ,ROW_NUMBER() OVER(order by [comal_id]) row_num
	FROM [TFG].[dbo].[comercios_alimentos] a
	where a.commar_id is null
	and a.comal_tipo_oferta <> 'Precios Cuidados'
)
UPDATE a
SET a.comal_precio = CONVERT(decimal(10, 2), CONVERT(decimal(10, 2), a.comal_precio) * 1.088)
   ,a.comal_peso_precio = CONVERT(decimal(10, 2), CONVERT(decimal(10, 2), a.comal_peso_precio) * 1.088)
FROM comercios_alimentos7 a
WHERE a.row_num between 7455 and 8520;

WITH comercios_alimentos8
AS  
(  
	SELECT [comal_id]
		  ,[commar_id]
		  ,[comal_nombre]
		  ,[comal_descripcion]
		  ,[comal_img_url]
		  ,[comal_precio]
		  ,[comal_cantidad]
		  ,[comal_cantidad_peso]
		  ,[comal_medida]
		  ,[comal_peso_medida]
		  ,[comal_peso_precio]
		  ,[comal_precio_desc]
		  ,[comal_peso_precio_desc]
		  ,[comal_tipo_oferta]
		  ,[comal_oferta]
		  ,ROW_NUMBER() OVER(order by [comal_id]) row_num
	FROM [TFG].[dbo].[comercios_alimentos] a
	where a.commar_id is null
	and a.comal_tipo_oferta <> 'Precios Cuidados'
)
UPDATE a
SET a.comal_precio = CONVERT(decimal(10, 2), CONVERT(decimal(10, 2), a.comal_precio) * 1.096)
   ,a.comal_peso_precio = CONVERT(decimal(10, 2), CONVERT(decimal(10, 2), a.comal_peso_precio) * 1.096)
FROM comercios_alimentos8 a
WHERE a.row_num between 8520 and 9585;

WITH comercios_alimentos9
AS  
(  
	SELECT [comal_id]
		  ,[commar_id]
		  ,[comal_nombre]
		  ,[comal_descripcion]
		  ,[comal_img_url]
		  ,[comal_precio]
		  ,[comal_cantidad]
		  ,[comal_cantidad_peso]
		  ,[comal_medida]
		  ,[comal_peso_medida]
		  ,[comal_peso_precio]
		  ,[comal_precio_desc]
		  ,[comal_peso_precio_desc]
		  ,[comal_tipo_oferta]
		  ,[comal_oferta]
		  ,ROW_NUMBER() OVER(order by [comal_id]) row_num
	FROM [TFG].[dbo].[comercios_alimentos] a
	where a.commar_id is null
	and a.comal_tipo_oferta <> 'Precios Cuidados'
)
UPDATE a
SET a.comal_precio = CONVERT(decimal(10, 2), CONVERT(decimal(10, 2), a.comal_precio) * 1.11)
   ,a.comal_peso_precio = CONVERT(decimal(10, 2), CONVERT(decimal(10, 2), a.comal_peso_precio) * 1.11)
FROM comercios_alimentos9 a
WHERE a.row_num between 9585 and 10651;

UPDATE a
SET a.comal_tipo_oferta = ''
   ,a.comal_oferta = ''
FROM TFG.dbo.comercios_alimentos a
WHERE a.comal_tipo_oferta = 'Propia'
AND a.commar_id is null

UPDATE a
SET a.[comal_precio_desc] = '$' + [comal_precio] + (case when [comal_medida] = 'Unidad' then ' x un.' when [comal_medida] = 'Kilogramo' then ' x kg.' end)
   ,a.[comal_peso_precio_desc] = '$' + [comal_peso_precio] + ' x ' + [comal_peso_medida]
FROM [TFG].[dbo].[comercios_alimentos] a
WHERE a.commar_id is null

--UPDATE a
--SET a.commar_id = 2
--FROM [TFG].[dbo].[comercios_alimentos] a
--WHERE a.commar_id is null
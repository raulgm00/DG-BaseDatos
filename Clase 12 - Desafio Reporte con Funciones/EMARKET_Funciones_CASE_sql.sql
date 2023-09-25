SELECT
	c.id AS id,
    UPPER(LEFT(c.nombre,10)),
    COALESCE(CONCAT(TIMESTAMPDIFF(YEAR,publicada,NOW()),' años'),'No tiene años') AS antiguedad,
        ROUND(c.bytes/1024) as kilobytes,
       CONCAT('$ ',FORMAT(c.precio_unitario,3)) AS precio,
       c.compositor
FROM musimundos.canciones c;
-- Desafio REPORTE 
SELECT  c.id AS id,
		UPPER(LEFT(c.nombre,10)) AS cancion,
        COALESCE(CONCAT(TIMESTAMPDIFF(YEAR,publicada,NOW()),' años'),'No tiene años') AS antiguedad,
        ROUND(c.bytes/1024) as kilobytes,
       CONCAT('$ ',FORMAT(c.precio_unitario,3)) AS precio,
       CASE
			WHEN c.compositor ='' or c.compositor IS NULL THEN '<Sin Datos>' -- NOMBRES NULL
            WHEN c.compositor  LIKE '%,%' THEN LEFT(c.compositor, LOCATE(',', c.compositor)-1)
            WHEN c.compositor  LIKE '%&%' THEN LEFT(c.compositor, LOCATE('&', c.compositor)-1)
            ELSE c.compositor
	    END AS Compositor
FROM musimundos.canciones c;

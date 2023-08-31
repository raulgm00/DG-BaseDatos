SELECT * FROM emarket.clientes c;

CREATE VIEW v_clientes AS
SELECT c.ClienteID,
 c.Contacto ,
 CASE
	WHEN c.Fax = '' THEN CONCAT('TEL: ', c.Telefono)
    ELSE c.Fax
 END AS FAX_TELEFONO
 FROM emarket.clientes c;
 
 SELECT * FROm v_clientes;
 
 -- Ejercicio 002
 -- a
 SELECT cli.ClienteID, cli.Compania, cli.Telefono
 FROM emarket.clientes cli
 WHERE cli.Fax = '';
 -- b
 SELECT * 
 FROM v_clientes
 WHERE FAX_TELEFONO LIKE 'TEL:%';
 
 -- EJERCICIO Proveedores
 -- 1
 CREATE VIEW v_provedores_direcciones AS
 SELECT pro.ProveedorID, pro.Contacto, CONCAT(pro.Direccion, ' ', pro.Ciudad,' ', pro.CodigoPostal, ' ', pro.Pais) AS Direccion
 FROM emarket.proveedores pro;
 
 -- 2
 -- a) 
 SELECT * 
 FROM emarket.proveedores pro
 WHERE Direccion LIKE '%Americanas%';
 -- b) 
 SELECT * 
 FROM v_provedores_direcciones
 WHERE Direccion LIKE '%Americanas%';
 
 
-- Vistas - Partes II para control stock
SELECT * FROM emarket.productos pro;

CREATE VIEW v_productos_prioridad AS
SELECT 	pro.ProductoID, pro.ProductoNombre, 
		FORMAT(ROUND(pro.PrecioUnitario),0) AS PrecioUnitario, 
        pro.UnidadesStock, pro.UnidadesPedidas,
        CASE
			WHEN pro.UnidadesPedidas = 0 THEN 'BAJA'
            WHEN pro.UnidadesPedidas < pro.UnidadesStock THEN 'MEDIA'
            WHEN pro.UnidadesPedidas < (pro.UnidadesStock*2) THEN 'URGENTE'
			ELSE 'SUPER URGENTE'
        END AS prioridad
FROM emarket.productos pro;
 
 
 SELECT ProductoID, prioridad, UnidadesStock, PrecioUnitario 
 FROM v_productos_prioridad
 WHERE UnidadesStock < 5;
 
 
 
 
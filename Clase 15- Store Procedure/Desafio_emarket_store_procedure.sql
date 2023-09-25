-- ////////////////////////////////////////////////////////////////////////////////////////////////
-- 1) Empleados
--    a) Crear un SP que liste los apellidos y nombres de los empleados ordenados alfabéticamente.
delimiter $$
create procedure sp_listar_apellidos_nombres()
begin
	select Apellido, Nombre from empleados order by Apellido;
end $$ 
--    b) Invocar el SP para verificar el resultado.
call sp_listar_apellidos_nombres;

-- ////////////////////////////////////////////////////////////////////////////////////////////////
-- 2) Empleados por ciudad
--    a) Crear un SP que reciba el nombre de una ciudad y liste los empleados de esa ciudad.
delimiter $$
create procedure sp_listar_empleadosxciudad(in filtro_ciudad varchar(15))
begin
	select * from empleados where ciudad = filtro_ciudad;
end $$
--    b) Invocar al SP para listar los empleados de Seattle.
call sp_listar_empleadosxciudad("Seattle");

-- ////////////////////////////////////////////////////////////////////////////////////////////////
-- 3) Clientes por país
--    a) Crear un SP que reciba el nombre de un país y devuelva la cantidad de clientes en ese país.
delimiter $$
create procedure sp_cantidad_clientes_xpais(in filtro_pais varchar(15))
begin
	select count(*) from Clientes where Pais = filtro_pais;
end $$
--    b) Invocar el SP para consultar la cantidad de clientes en Portugal.
call sp_cantidad_clientes_xpais("Portugal");

-- ////////////////////////////////////////////////////////////////////////////////////////////////
-- 4) Productos sin stock
--    a) Crear un SP que reciba un número y liste los productos cuyo stock está por debajo de ese número.
--       El resultado debe mostrar el nombre del producto, el stock actual y el nombre de la categoría a la que pertenece el producto.
delimiter $$
create procedure sp_listar_productos_stock(in stock smallint(6))
begin
	select * from Productos where UnidadesStock < stock;
end $$
--    b) Listar los productos con menos de 10 unidades en stock.
call sp_listar_productos_stock(10);
--    c) Listar los productos sin stock.
call sp_listar_productos_stock(1);

-- ////////////////////////////////////////////////////////////////////////////////////////////////
-- 5) Ventas con descuento
--    a) Crear un SP que reciba un porcentaje y liste los nombres de los productos que
--       hayan sido vendidos con un descuento igual o superior al valor indicado,
--       indicando además el nombre del cliente al que se lo vendió.
delimiter $$
create procedure sp_listar_productos_vendidos_porcentaje(in porcentaje double)
begin
	select p.ProductoID, p.ProductoNombre, fd.FacturaID, fd.Descuento, c.compania
	from Productos p 
	inner join FacturaDetalle fd on p.ProductoID = fd.ProductoID
	left join Facturas f on fd.FacturaID = f.FacturaID
	left join Clientes c on f.ClienteID = c.ClienteID 
	where fd.descuento >= (porcentaje / 100);
end $$
--    b) Listar la información de los productos que hayan sido vendidos con un descuento mayor al 10%.
call sp_listar_productos_vendidos_porcentaje(10);
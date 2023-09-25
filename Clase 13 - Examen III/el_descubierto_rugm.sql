USE el_descubierto;
SET sql_mode = 'ONLY_FULL_GROUP_BY';
-- Raul Garcia
/*22. Por cada sucursal, contar la cantidad de clientes y el saldo promedio de sus
cuentas.*/
SELECT suc.numero AS NUM_SUC, COUNT(cliente_id) AS NUM_CLIENTES, AVG(cue.saldo) SALDO_PRO 
FROM el_descubierto.sucursal suc
RIGHT JOIN el_descubierto.cuenta cue ON suc.numero= cue.sucursal_numero
RIGHT JOIN el_descubierto.cliente_x_cuenta cxc ON cue.numero = cxc.cuenta_numero
RIGHT JOIN el_descubierto.cliente cli ON cxc.cliente_id= cli.id
GROUP BY NUM_SUC
HAVING suc.numero IS NOT NULL;

/*23. Listar todos aquellos clientes que teniendo un saldo negativo en la cuenta,
tengan un descubierto otorgado mayor a cero. Mostrar el apellido, nombre,
saldo y descubierto otorgado.*/

SELECT cli.apellido, cli.nombre, cue.saldo as saldo_neg, cue.descubierto_otorgado as descubierto
FROM el_descubierto.cliente cli
RIGHT JOIN el_descubierto.cliente_x_cuenta cxc ON cli.id = cxc.cliente_id 
RIGHT JOIN el_descubierto.cuenta cue ON cxc.cuenta_numero = cue.numero
HAVING saldo_neg < 0 AND descubierto > 0 ;



/*24. Se desea conocer el último acceso de cada cliente al sistema. Mostrar el nombre,
apellido y última fecha de acceso.*/
SET sql_mode = 'ONLY_FULL_GROUP_BY';
SELECT hcc.cliente_id as ID, cli.nombre AS NOMBRE , cli.apellido AS APELLIDO, MAX( hcc.acceso ) AS ULTIMA_FECHA_ACCESO
FROM el_descubierto.cliente cli 
RIGHT JOIN el_descubierto.historial_acceso hcc ON cli.id = hcc.cliente_id
GROUP BY ID
ORDER BY ID;


/*25. Listar el apellido y nombre de todos los empleados del banco. Si poseen cuentas
a cargo, mostrar cuántas. Ordenar por apellido y nombre.*/
SELECT * FROM  el_descubierto.empleado;
SELECT * FROM  el_descubierto.cuenta;

SELECT emp.nombre NOMBRE , emp.apellido APELLIDO ,  COUNT(*)
FROM el_descubierto.empleado emp
RIGHT JOIN el_descubierto.cuenta cue ON emp.legajo = cue.ejecutivo_cuenta
GROUP BY emp.legajo
HAVING emp.legajo IS NOT NULL
ORDER BY APELLIDO AND NOMBRE;


/*10. Reportar el número del préstamo y la cantidad de cuotas pagadas por cada uno
préstamo. Se debe formatear el dato de la cantidad de cuotas pagadas, por
ejemplo, si se ha pagado una cuota, sería "1 cuota paga"; si se han pagado dos o
más cuotas, sería en plural "2 cuotas pagas" y "Ninguna cuota paga" para los
préstamos que aún no han recibido un pago.*/
SELECT * FROM el_descubierto.pago;
SELECT * FROM el_descubierto.prestamo;

SELECT pre.id, 
	CASE
		WHEN count(*) = 1 THEN concat (count(*), " cuota paga")
        WHEN count(*) > 1 THEN concat (count(*), " cuotas pagas")
        ELSE "Ninguna cuota paga"
	END AS Pagos
FROM prestamo pre
LEFT JOIN pago pa ON pre.id = pa.prestamo_id
GROUP BY pre.id;









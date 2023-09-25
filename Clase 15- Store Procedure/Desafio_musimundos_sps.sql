/*Crear un stored procedure que solicite como parámetros de entrada el
nombre de un país y una ciudad, y que devuelva como resultado la
información de contacto de todos los clientes de ese país y ciudad.
En el caso que el parámetro de ciudad esté vacío, se debe devolver todos los
clientes del país indicado.*/
DELIMITER $$
CREATE PROCEDURE sp_informacionContacto(IN nombre_pais VARCHAR(20), IN ciudad VARCHAR(20))
BEGIN
	SELECT cli.telefono AS Telefono , cli.fax AS FAX, cli.email AS EMAIL
    FROM musimundos.clientes cli
    WHERE cli.pais = nombre_pais OR cli.ciudad = ciudad;
END$$
DELIMITER

CALL sp_informacionContacto('Germany','');
/*Invocar el procedimiento para obtener la información de los clientes de
Brasilia en Brazil.*/
CALL sp_informacionContacto('Brazil.','Brasilia');
/*Invocar el procedimiento para obtener la información de todos los clientes
de Brazil.*/
CALL sp_informacionContacto('Brazil','');


/*Crear un stored procedure que reciba como parámetro un nombre de
género musical y lo inserte en la tabla de géneros.
Además, el stored procedure debe devolver el id de género que se insertó.
TIP! Para calcular el nuevo id incluir la siguiente línea dentro del bloque de
código del SP: SET nuevoid = (SELECT MAX(id) FROM generos) + 1;*/

DROP PROCEDURE sp_inserccionGeneros;

DELIMITER $$
CREATE PROCEDURE sp_inserccionGeneros(IN genero_nuevo VARCHAR(10), OUT nuevoid INT)
BEGIN
	SET nuevoid = (SELECT MAX(id) FROM generos) + 1;
    INSERT INTO generos VALUES (nuevoid,genero_nuevo);
   
END$$

/*Invocar el stored procedure creado para insertar el género Funk. ¿Qué id
devolvió el SP ? Consultar la tabla de géneros para ver los cambios.*/
CALL sp_inserccionGeneros('Folk', @nuevoid);
SELECT @nuevoid;












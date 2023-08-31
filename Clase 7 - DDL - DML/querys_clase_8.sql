SELECT * FROM artistas ORDER BY id DESC; /*LIMIT 11 OFFSET 20;*/
DESCRIBE artistas;

/*ALTER TABLE `musimundos`.`artistas` 
CHANGE COLUMN `id` `id` SMALLINT NOT NULL AUTO_INCREMENT ;*/

/*CREATE*/
INSERT INTO artistas VALUES (276, 'Mana');
/*READ*/
SELECT * FROM artistas ORDER BY id DESC;
/*UPDATE*/
UPDATE artistas SET nombre='Mána' WHERE id = 276;
/*DELETE*/
DELETE FROM artistas WHERE id=276;

SELECT * FROM albumes; /*WHERE nombre LIKE '%pol%' ORDER BY  nombre;*/
SELECT clientes.primer_nombre, clientes.apellido, clientes.pais FROM clientes WHERE clientes.pais= 'USA';
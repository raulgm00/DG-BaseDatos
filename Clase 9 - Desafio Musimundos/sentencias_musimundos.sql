USE movies_db;
SELECT * 
FROM movies_db.movies;

SELECT MAX(A.rating), COUNT(*)
FROM movies_db.movies A
WHERE A.genre_id =3;

SELECT A.title, A.rating
FROM movies_db.movies A
WHERE A.genre_id =3;

SELECT SUM(A.rating)
FROM movies_db.movies A
WHERE A.genre_id =3;

-- Ejemplos de Group By

USE movies_db;
SELECT * 
FROM movies_db.movies;

SELECT A.title AS titulo, COUNT(*)
FROM movies_db.movies A
GROUP BY titulo;

SELECT * 
FROM movies_db.actor_episode ;
SELECT * 
FROM movies_db.actors ;


SELECT A.id ePISODIO, A.actor_id AS ID_actor, COUNT(*) numero_veces_agrupado_x_id, CONCAT(B.first_name, " ", last_name) as Nombre 
FROM movies_db.actor_episode A
LEFT JOIN movies_db.actors B ON A.actor_id = B.id
GROUP BY ID_actor; -- Se agrupan por columna que se repiten

USE movies_db;
SELECT *
FROM movies_db.movies;

SELECT A.genre_id, COUNT(*), AVG(A.length)
FROM movies_db.movies A
-- DESPUES DEL WHERE
-- GROUP BY
GROUP BY  A.genre_id
-- PERO ANTES DEL ORDER BY && LIMMIT 
-- NO ANTES DE HAVIND -- solo se va a poder usar en conjunto con las funciones de agregación para filtrar datos agregados
;
USE movies_db;
DESCRIBE movies_db.movies;
DESCRIBE movies_db.genres;
SELECT A.title , COUNT(*) num_peliculas_agrupados, MAX(A.rating) maximo, AVG( A.length )
FROM movies_db.movies A
INNER JOIN  movies_db.genres B ON A.genre_id = B.id
GROUP BY A.genre_id 
HAVING num_peliculas_agrupados >=3;



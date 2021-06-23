/*2. Agregue una película a la tabla movies.*/

INSERT INTO movies (title, rating, awards, release_date, length, genre_id) 
			VALUES ('La bella y la bestia', 9.0, 0, '1999-01-01', 120, 11);

/*3. Agregué un género a la tabla genres.*/

INSERT INTO genres (created_at, name, ranking) 
			VALUES (now(), 'Oriental', 21);

/*4. Asocie a la película del Ej 2. con el género creado en el Ej. 3.*/

UPDATE movies SET genre_id = 13 WHERE id = 22;

/*5. Modifique la tabla actors para que al menos un actor tenga como favorita la película agregada en el Ej.2.*/

UPDATE actors SET favorite_movie_id = 22 WHERE favorite_movie_id IS NULL;

/*6. Cree una tabla temporal copia de la tabla movies.*/

CREATE TEMPORARY TABLE movie_temp SELECT * FROM movies;

SELECT * FROM movie_temp;

/*7. Elimine de esa tabla temporal todas las películas que hayan ganado menos de 5 awards.*/

SET SQL_SAFE_UPDATES = 0;
DELETE FROM movie_temp WHERE awards < 5;

/*8. Obtenga la lista de todas los géneros que tengan al menos una película.*/

SELECT * 
FROM genres g
INNER JOIN movies m
ON m.genre_id = g.id;

/*9. Obtenga la lista de actores cuya película favorita haya ganado más de 3 awards.*/

SELECT * 
FROM actors a
INNER JOIN movies m
ON a.favorite_movie_id = m.id
WHERE m.awards > 3;

/*10. Utilice el explain plan para analizar las consultas del Ej.6 y 7.*/

/*12. Cree un índice sobre el nombre en la tabla movies.*/

CREATE INDEX movies_title_idx ON movies(title);

/*13. Chequee que el indice fue creado correctamente.*/

SHOW INDEX FROM movies;

/* Extra. Ordenar actores por cantidad de géneros que actuó. Mostrar nombre y apellido del actor, y cantidad de géneros.*/

SELECT a.first_name, a.last_name, count(g.name) as 'Cantidad de generos'
FROM actors a
INNER JOIN actor_movie am
ON am.actor_id = a.id
INNER JOIN movies m
ON m.id = am.movie_id
INNER JOIN genres g
ON g.id = m.genre_id
GROUP BY a.first_name, a.last_name
ORDER BY first_name;

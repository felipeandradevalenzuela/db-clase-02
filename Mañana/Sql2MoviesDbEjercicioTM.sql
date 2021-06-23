/*1. Mostrar el título y el nombre del género de todas las series.*/

SELECT m.title as Movie, g.name as Genre 
FROM movies m 
JOIN genres g 
ON g.id = m.genre_id;

/*2. Mostrar el título de los episodios, el nombre y apellido de los actores que trabajan en cada uno de ellos.*/

SELECT e.title as Episode, a.first_name, a.last_name 
FROM episodes e 
JOIN actor_episode ae 
ON e.id = ae.episode_id 
JOIN actors a 
ON a.id = ae.actor_id;

/*3. Mostrar el título de todas las series y el total de temporadas que tiene cada una de ellas.*/

SELECT ser.title as Título, count(sea.serie_id) as Temporadas
FROM series ser
INNER JOIN seasons sea 
ON sea.serie_id = ser.id
GROUP BY ser.title;

/*4. Mostrar el nombre de todos los géneros y la cantidad total de películas por cada uno, siempre que sea mayor o igual a 3.*/

SELECT g.name as Genero, count(m.genre_id) as Total
FROM genres g 
INNER JOIN movies m 
ON m.genre_id = g.id
GROUP BY g.name
HAVING Total >= 3
ORDER BY TOTAL desc;


/*5. Mostrar sólo el nombre y apellido de los actores que trabajan en todas las películas de la guerra de las galaxias y que estos no se repitan.*/

SELECT DISTINCT a.first_name, a.last_name 
FROM actors a 
INNER JOIN actor_movie am
ON a.id = am.actor_id
WHERE am.movie_id 
IN (SELECT id FROM movies WHERE title LIKE "La Guerra de las Galaxias%");






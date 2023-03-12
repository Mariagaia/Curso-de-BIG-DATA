--Los directores de peliculas de jb han trabajado en promedio en dos peliculas cada uno ¿´como obendrías esta informacion?
WITH primera AS (SELECT director,count(Film) AS total_films
	FROM jamesbond
	GROUP BY 1) 
SELECT avg (total_films)  AS dospelis FROM primera 
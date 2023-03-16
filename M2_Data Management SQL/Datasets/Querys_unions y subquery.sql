--UNIONS 
SELECT animal,patas FROM ANIMALES1
	UNION
select bicho,color from BICHOS 

order by bicho

-- SUBQUERY 1
WITH my_subquery AS (SELECT Sector, SUM(Revenue) AS total_revenue 
	FROM fortune
	GROUP BY 1) -- hasta aquí la primera query, donde my_subquery es el nombre de la tabla,
    --y sector y  total_revenue son las tablas sobre las que puedo hacer la segunda tabla
SELECT AVG (total_revenue) AS avg_sector_revenue FROM my_subquery -- esta es la segunda query que se hace sobre el resultado de la primera. 
--En la segunda query ya no puedo hacer referencia a ninguno de los campos de la bbdd, solo a los que use en la primera tabla

-- SUBQUERY 2
--Los directores de peliculas de jb han trabajado en promedio en dos peliculas cada uno ¿´como obendrías esta informacion?
WITH primera AS (SELECT director,count(Film) AS total_films
	FROM jamesbond
	GROUP BY 1) 
SELECT avg (total_films)  AS dospelis FROM primera 
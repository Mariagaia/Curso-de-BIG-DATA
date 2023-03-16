--Query S5 - EX.1

--Los directores de películas de James Bond han trabajado en promedio en dos películas cada uno. ¿Cómo obtendrías esta información?

WITH
my_subquery AS(
SELECT
director,COUNT (Film) AS total_film
FROM `jamesbond_new`
GROUP BY 1)
SELECT AVG (total_film) AS avg_sector_revenue FROM my_subquery;

SELECT
director
,COUNT(Film) AS total_film
FROM jamesbond
GROUP BY director;

Opcion 2

SELECT avg(total_film)
FROM (SELECT
director
,COUNT(Film) AS total_film
FROM `jamesbond_new`
GROUP BY director);




Query S5 - EX.2

La tabla gobierno_paro reporta data mensual de paro para municipios de España en 2018. Calcular la media de paro de cada comunidad autónoma en 2018.

Tabla: gobierno_paro


WITH
my_subquery AS(
SELECT
comunidad_autonoma,sum (total_paro_registrado) AS total_paro
FROM `gobierno_paro`
GROUP BY comunidad_autonoma)
SELECT comunidad_autonoma, AVG (total_paro) AS avg_paro_comunidad FROM my_subquery;



Query S5 - Ex.3

Extraer consolas no discontinuadas y su fecha de lanzamiento (first retail availability). Agregar ventas globales de videojuegos  publicados desde el año 2000. Ordenar según ventas totales de videojuegos (descendiente).
Table 1: videogames_games
Table 2: videogames_consoles


Paso 1

SELECT platform_code, console_name, first_retail_availability FROM 'videogames_consoles'
WHERE discontinued = ''
;

Paso 2

SELECT platform_code, sum(na_sales)+sum(eu_sales)+sum(jp_sales)+(other_sales) AS [globlal_sales] FROM 'videogames_games'
GROUP BY platform_code
;

Paso 3 hacemos la JOIN

SELECT t1.console_name, t1.first_retail_availability, sum(t2.na_sales)+sum(t2.eu_sales)+sum(t2.jp_sales)+(t2.other_sales) AS [global_sales]
FROM videogames_consoles t1
INNER JOIN videogames_games t2
ON (t1.platform_code = t2.platform_code)
WHERE t1.discontinued ='' AND t2.year >= 2000
GROUP BY t1.platform_code
ORDER BY global_sales DESC
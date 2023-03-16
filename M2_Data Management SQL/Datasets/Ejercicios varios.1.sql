**EX 11.1, Módulo 2 EXAMEN**

--¿Cuántas películas duran menos de 60 minutos?; ¿Cuántas entre 60 y 100? Y
--¿Cuántas más de 100?

+++ OPCION 1 +++

SELECT

    COUNT(CASE WHEN duration > 100 THEN movie_title end) as mas_de_100,
    COUNT(CASE WHEN duration BETWEEN 60 AND 100 THEN movie_title end) as entre_60_y_100,
    COUNT(CASe WHEN duration <60 THEN movie_title end) as menos_de_60
    
    FROM imdb_movies
    
    WHERE duration !='NA'


+++ OPCION 2 +++

SELECT COUNT(movie_title),

CASE
    WHEN duration>100 THEN 'Mas de 100 minutos'
    WHEN duration BETWEEN 60 and 100 THEN 'Entre 60 y 100 minutos'
    WHEN duration<60 THEN 'Menos de 60 minutos' END AS Minutos_por_pelicula
    
    FROM imdb_movies
   
   
Group BY 2

HAVING duration != 'NA'

ORDER BY 1 DESC


**EX 11.2, Módulo 2 EXAMEN**

--¿Cuántas películas de acción hay que duren menos de 60 minutos? Haz un
--listado de las mismas

+++ OPCION 1 +++

SELECT
	movie_title, duration
 --CASE WHEN genres LIKE '%Action%' THEN 'Acción' END AS Genero
 FROM imdb_movies
 WHERE duration < 60 AND genres LIKE '%Action%'


**EX 11.3, Módulo 2 EXAMEN**
--¿Cuál sería el día de menos cotización en una tendencia alcista en el año
--2018?; ¿Y la media ese mismo día?
SELECT

date, MIN(high) AS Cotizacion, round(SUM(high + close + open + low),2) AS Media_diaria

FROM bitcoin_daily_rates_formatdate

WHERE

EXTRACT(year FROM date) = 2018 and high = 3241

OR

SELECT

date, min(high) AS Cotizacion, round((high + close + open + low)/4,2) AS Media_diaria

FROM bitcoin_daily_rates_formatdate

WHERE

extract(year FROM Date) = 2018

#GROUP BY 1
ORDER BY 2
LIMIT 1


**EX 11.4, Módulo 2 EXAMEN**

--Mostrar el conteo de las películas relacionadas con los géneros (Action, Crime,
--Comedy, Drama, Romance), indicando la película con mayor número de votos
--en cada caso (num_voted_users).
--** Utilizar el orden de (Action, Crime, Comedy, Drama, Romance) al realizar la
--tabla

SELECT
CASE
WHEN gender LIKE '%Action%' THEN  'Action Movies'

WHEN gender LIKE '%Crime%' THEN  'Crime Movies'

WHEN gender LIKE '%Comedy%' THEN  'Comedy Movies'

WHEN gender LIKE '%Drama%' THEN  'Drama Movies'

WHEN gender LIKE '%Romance%' THEN  'Romance Movies'

END AS gender_movies,

COUNT(movie_title) AS Total_Peliculas,

CASE
WHEN num_voted_users = Max(num_voted_users) THEN movie_title
END AS Pelicula,

Max(num_voted_users) AS voted_of_movie

FROM imdb_movies
GROUP BY 1
HAVING gender_movies IS NOT null
ORDER BY 4


**EX 11.5, Módulo 2 EXAMEN**

--Mostrar el número de personajes que tienen el mismo color de ojos (eye_color)
--y el planeta de origen (homeworld). No mostrar color de ojos desconocidos
--(unknown) ni planetas sin datos/nombre (NA)

SELECT count(name), eye_color, homeworld

FROM star_wars_characters_buena

GROUP BY eye_color,homeworld

HAVING COUNT(name)>1 AND homeworld <> 'NA' and eye_color <> 'NA'
ORDER BY 1 DESC



**EX 11.6, Módulo 2 EXAMEN**

--Identificar y calcular el presupuesto de aquellas películas de James Bond que
--fueron dirigidas por John Glen y protagonizadas por Timothy Dalton

SELECT film, Actor, director, budget

FROM jamesbond

WHere actor='Timothy Dalton' and director='John Glen'



**EX 11.7, Módulo 2 EXAMEN**

-- ¿Cuál es el monto de los créditos otorgados y no otorgados según el Status
-- personal?

+++ OPCION 1 +++

SELECT personal_status,
    SUM(CASE WHEN class='good' THEN credit_amount END) AS Otorgado,
    SUM(CASE WHEN class='bad' THEN credit_amount END) AS No_Otorgado,
    SUM(credit_amount) AS Suma_total

FROM LoanData

GROUP BY personal_status


**EX 11.8, Módulo 2 EXAMEN**

-- Obtén un listado de las películas de acción con actor protagonista con más de
-- 10000 likes en Facebook y cuyas películas hayan sido valoradas con al menos
-- un 8 en imdb. Todo ello con fechas anteriores a 2012

select
actor_1_facebook_likes, imdb_score,
movie_title, title_year
from imdb_movies
WHERE actor_1_facebook_likes>10000 and imdb_score>8 and title_year<2012 
AND gender LIKE "%Action%"
ORDER BY 1 DESC


**EX 11.9, Módulo 2 EXAMEN**

--Queremos saber cuáles son las 20 películas y género al que pertenecen,
--1) con mayor presupuesto
--2) con mayor beneficio

select movie_title, gender, budget, gross
from imdb_movies
order by 3 DESC --order by 4 DESC
limit 20

**EX 11.10, Módulo 2 EXAMEN**

select location, profits, rank, employees
from fortune
group by location
order by rank
limit 10

OR

select DISTINCT location, profits, rank, employees
from fortune
order by 3
limit 10

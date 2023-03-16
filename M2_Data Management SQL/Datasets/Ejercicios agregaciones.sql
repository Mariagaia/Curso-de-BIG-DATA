--**EX 1, Módulo 2 (Agregaciones)**
--Agregar las siguientes métricas para todos los países africanos,
-- average gross income per capita
-- total population
-- number of countries
--Tabla: world_health_org (`Basics.world_health_org`) Descripción de la tabla: esta tabla contiene data de países del 
--mundo publicados por la Organización Mundial de la Salud

SELECT
round(avg (CASE WHEN continent = 'Africa' THEN gross_income_per_capita END),2) AS africa_AVG_GDP,
sum (CASE WHEN continent = 'Africa' THEN population_in_thousands END) AS total_population,
COUNT (CASE WHEN continent = 'Africa' THEN country END) AS count_countries
FROM world_health_org;



--**EX 2, Módulo 2 (Agregaciones)**
--Calcular número de personajes según planeta (homeworld). Evitar personajes sin información sobre planeta de origen.
--Tabla: star_wars_characters (`star_wars_characters`) Descripción de la tabla: esta tabla incluye datos sobre personajes de Star Wars


SELECT homeworld, COUNT(name) AS count_characters
FROM star_wars_characters
--WHERE homeworld !='NA'
GROUP BY homeworld
ORDER BY COUNT(name) DESC
LIMIT 5;



--EX 3, Módulo 2 (Agregaciones)**
--Calcular el total de salario percibido por cada actor en todas las películas. Omitir películas sin data sobre salario.
--Tabla: james_bond (`sepe-sql-256409.SQL_Basics.james_bond`) Descripción de la tabla: esta tabla reporta data sobre películas de James Bond

SELECT actor, ROUND(SUM(Bond_Actor_Salary),1) as bond_salary
FROM james_bond
WHERE Bond_Actor_Salary IS NOT NULL  --en sqlite: bond_actor_salary != 'NA'
GROUP BY 1
ORDER BY bond_salary DESC



--**EX 4, Módulo 2 ((Agregaciones))**
--¿Podemos asegurar que las películas de acción tienen de media mejor valoración que
--el resto de películas? Extraer total de películas y media de IMDB score para películas
--de acción vs. el resto (de forma conjunta).
--Tabla: imdb_movies

SELECT

  CASE WHEN gender LIKE '%Action%' THEN 'Action Movies' ELSE 'Rest of Movies' END as gender

, COUNT(*) as total_movies

, ROUND(AVG(imdb_score),2) as AVG_imdb_score

FROM imdb_movies

GROUP BY 1



--EX 5, Módulo 2 ((Agregaciones))**
--Calcular la facturación (box office) según director. Filtrar por aquellos
--directores que hayan generado más de 1500 en el total de facturación (todas
--las películas).
--Tabla: james_bond
--Descripción de la tabla: esta tabla reporta data sobre películas de James Bond

SELECT

Director

,ROUND(SUM(Box_Office)) as total_box_office

FROM `sepe-sql-256409.SQL_Basics.james_bond`

GROUP BY 1

HAVING total_box_office>1500

ORDER BY total_box_office DESC



--**EX 6, Módulo 2 ((Agregaciones))**

--Calcular número total de álbumes según sub metal genre, filtrar por aquellos subgéneros con al menos 10 álbumes.
--Tabla: rolling_top_albums
--Descripción de la tabla: esta tabla incluye datos sobre álbumes de música heavy metal

SELECT 

Sub_Metal_Genre

,COUNT(Album) as count_albums

FROM `rolling_top_albums`

GROUP BY 1

HAVING count_albums>=10

ORDER BY count_albums DESC



--**EX 7, Módulo 2 ((Agregaciones))**

--¿Cuántos artistas hay incluídos en el dataset cuyo nombre incluye las palabras ‘god’, ‘death’ or ‘black’?
-- Tabla: rolling_top_albums
-- Descripción de la tabla: esta tabla incluye datos sobre álbumes de música

SELECT

CASE

  WHEN upper(Artist) LIKE '%DEATH%' THEN 'DEATH'

  WHEN upper(Artist) LIKE '%BLACK%' THEN 'BLACK'

  WHEN upper(Artist) LIKE '%GOD%' THEN 'GOD'

  END AS artist_keyword,

COUNT(DISTINCT Artist) AS count_artist

FROM `rolling_top_albums`

WHERE

  Artist LIKE '%DEATH%'

  OR Artist LIKE '%BLACK%'

  OR Artist LIKE '%GOD%'

GROUP BY 1

ORDER BY 2 DESC



--**EX 8, Módulo 2 ((Agregaciones))**

-- Extraer media mensual del la cotización (open rate) y volumen de operación (volumen USD) del bitcoin desde el año 2016.
-- Tabla: bitcoin_daily_rates
-- Descripción de la tabla: esta tabla incluye cotizaciones diarias de bitcoin

SELECT

  EXTRACT(MONTH FROM Date) as month,

  EXTRACT(YEAR FROM Date) as year,

  ROUND(AVG(Open),2) as AVG_open_rate,

  ROUND(AVG(Volume_USD)) as AVG_volume_USD

FROM Basics.bitcoin_daily_rates

WHERE

  EXTRACT(YEAR FROM Date) >= 2016

GROUP BY 1,2

ORDER BY year,month


*****EN SQLite

SELECT

  strftime('%m', Date) as month,

  strftime ('%Y', Date) as year,

  ROUND(AVG(Open),2) as AVG_open_rate,

  ROUND(AVG(Volume_USD)) as AVG_volume_USD

FROM bitcoin_daily_rates_formatdate

WHERE

  year >= '2016'

GROUP BY 2,1



**EX 9, Módulo 2 ((Agregaciones))**
-- ¿Cuál fue la semana con el valor mayor de cotización? Utilizar cotización high.
-- Tabla: amazon_stocks
-- Descripción de la tabla: esta tabla incluye cotizaciones diarias de la acción de Amazo

SELECT date,

  --DATE_TRUCK(date, WEEK) AS comienzo_de_semana NO FUNCIONA EN SQLite

  srtftime('%W', date) AS num_semana,
  
  max(high) AS max_rate

FROM amazon_stocks_formatdate



**EX 10, Módulo 2 ((Agregaciones))**

-- Calcular el total de sesiones según canal para octubre de 2019. Crear métricas específicas agregadas para cada dispositivo.
-- Tabla: google_analytics
-- Descripción de la tabla: contiene data extraída de Google Analytics para una web dummy

SELECT

  channelGrouping

  ,SUM(CASE WHEN deviceCategory = 'mobile' THEN sessions END) AS mobile_sessions

  ,SUM(CASE WHEN deviceCategory = 'desktop' THEN sessions END) AS desktop_sessions

  ,SUM(CASE WHEN deviceCategory = 'tablet' THEN sessions END) AS tablet_sessions

  ,SUM(sessions) AS total_sessions

FROM google_analytics_formatdate

WHERE
  
  --date BETWEEN '2019-10-01' AND '2019-10-31' **esto seria para SQLite**

  strftime('%Y', date)='2019?

  AND EXTRACT(MONTH FROM date)=10

GROUP BY 1

ORDER BY total_sessions DESC



*******En SQLite:

SELECT channelGrouping,

  SUM(CASE WHEN deviceCategory = 'mobile' THEN sessions END) AS mobile_sessions,

  SUM(CASE WHEN deviceCategory = 'desktop' THEN sessions END) AS desktop_sessions,

  SUM(CASE WHEN deviceCategory = 'tablet' THEN sessions END) AS tablet_sessions,

  SUM(sessions) AS total_sessions

FROM google_analytics_formatdate
WHERE
  strftime('%Y', date)='2019' AND strftime('%m', date)='10'
GROUP BY 1
ORDER BY total_sessions DESC
--1)  De la tabla videogames_games, ordenar por año y mostrar resultados del nombre del juego que fue publicado por Nintendo en el año 1995
--en adelante, que no se llame “Donkey Konga 2”, que vendiera entre cero y 0,32 en Europa, entre cero y 0,31 en America,
--y entre cero y 0,3 en otros territorios.


SELECT name, platform_code, na_sales, eu_sales, other_sales, year FROM videogames_games
where name <> 'Donkey Konga 2' AND
publisher = 'Nintendo' AND YEAR >= 1995 AND
eu_sales BETWEEN 0 and 0.32 AND
na_sales BETWEEN 0 and 0.31 AND
other_sales BETWEEN 0 and 0.3
ORDER BY YEAR
LIMIT 1


-- 2)  Tabla: star_wars_characters. Nombre de los personajes de Star Wars que tengan los ojos distintos a rojo y que sean de los mundos
--Chandrila, Stewjon o Tatooine. Añadir un nuevo campo “tamaño” que nos diga si es “grande” cuando la altura  sea mayor o igual a 200 y 
--“pequeño” si es menor de 200. Por último ordenar por altura de menor a mayor.

SELECT name, eye_color, homeworld, height,
CASE WHEN
    height >= 200 THEN 'grande'
    ELSE 'pequeño' END AS 'Tamaño'
FROM star_wars_characters_2
WHERE homeworld IN ('Chandrila', 'Stewjon', 'Tatooine') and eye_color <> 'red'
ORDER BY height

--3)  De la tabla fortune, queremos ver sólo las 100 primeras compañías según el rango, sin incluir a Citigroup,
--viendo sólo las compañías dentro del sector financiero; industria diversified financials y crearemos un nuevo campo de rentabilidad 
--en el que divida a las compañías entre rentables y no rentables si sus beneficios son mayores o menores a 1000.

Select rank, company, sector, industry, profits,
case WHEN
    profits >= 1000 THEN 'rentable'
    ELSE 'no rentable' END AS 'rentabilidad'
from fortune
WHERE sector = 'Financials' AND industry = 'Diversified Financials' AND rank < 100 AND Company <> 'Citigroup'
ORDER BY rank

--4)  En la tabla gobierno_paro, filtrar por el mes de ‘Enero de 2018’ y el paro de hombres y mujeres de entre 25 y 45 años entre 1100 
--y 20 y ordenar los municipios con esos filtros de mayor paro resgistrado (del total) a menor. 
--Por último, añadir una nueva columna llamada ‘Comparación de paro’, agrupando el número total de parados en:
--mucho si es mayor que 1000, medio si es mayor que 500 y poco si es por debajo o igual a 500.

select municipio, paro_hombre_edad_25__45, paro_mujer_edad_25__45, total_paro_registrado,
case WHEN
    total_paro_registrado > 1000 THEn 'mucho'
    when total_paro_registrado > 500 THEN 'medio'
    ELSE 'poco' END AS 'comparacion de paro'
from gobierno_paro
where mes = 'Enero de 2018' and
paro_hombre_edad_25__45 BETWEEN 20 and 1100 AND paro_mujer_edad_25__45 BETWEEN 20 and 1100
order by total_paro_registrado DESC

--5)   En la tabla star_wars_characters, buscar el personaje que sea de un planeta que comience por la letra T y que no termine por la letra d,
--que mida más de 200 y que no sea un droide. Pista: el caracter comodin es %.

SELECT name, homeworld, height FROM star_wars_characters
WHERE homeworld like 'T%' and homeworld NOT like '%d' AND height > 200 and
species <> 'Droid'

--6)  En la tabla videogames_games, queremos ver los nombres de los juegos de platform_code ‘DS’ y años ordenados por año, 
--con las ventas en las tres regiones principales (NA, EU y JP). Teniendo en cuenta sólo estas regiones (ignorar other_sales), 
--queremos determinar en qué región ha vendido mejor cada juego. Para ello, generar un campo nuevo best_selling_region cuyo valor sea ‘NA’, 
--si NA_sales es mayor que EU_sales y que JP_sales; ‘EU’ en caso de que EU_sales sea mayor que NA_sales y JP_sales o ‘JP’ en el el tercer caso.

select name, platform_code, year, na_sales, eu_sales, jp_sales,
CASE WHEN
    na_sales > eu_sales and na_sales > jp_sales THEN 'NA'
    WHEN eu_sales > na_sales and eu_sales > jp_sales then 'EU'
    when jp_sales > na_sales and jp_sales > eu_sales THEN 'JP'
    end AS 'best_selling_region'

FROM videogames_games

WHERE platform_code = 'DS'
order BY year

--7)  Cuales son las películas  en USA, ordenados de forma descendente por duración en la tabla de imdb_movies. 
--añadir el nuevo campo ‘’SON MUY LARGAS’’ a las que duren  de 120 minutos a 200  minutos y ‘’son cortas’’ las que duren 120.

select movie_title, duration, country,
case when
    duration BETWEEN 120 and 200 THEN 'es larga'
    when duration < 120 THEN 'es cortas'
    ELSE 'sin tiempo'
    end as 'corta/larga'
from imdb_movies
WHERE country = 'USA'
order BY duration DESC

--8)  De la tabla gobierno_paro, cuál es la cifra de mujeres de 45 años que estaban en paro,
--donde la cifra de parados sin empleo anterior era cero, durante el mes de marzo de 2018, ordenado por municipios por órden alfabético descendente.

select paro_mujer_edad___45, municipio, mes, paro_sin_empleo_anterior
FROM gobierno_paro
WHERE mes ='Marzo de 2018' and paro_sin_empleo_anterior = 0
order by municipio DESC
when dura	

--9)  Las 50 películas a color de USA, desde el año 2000 a 2010 con un campo nuevo llamado 'Calificación según Facebook' 
--donde se evidencien tres variables: si tiene menos de 5.000 likes es 'Regular'; si tiene entre 5.000 y 10.000 likes es 'Buena' 
--y si tiene más de 10.000 likes es 'Muy Buena'. 

SELECT movie_title, color, country,
CASE WHEN
    movie_facebook_likes > 10000 THEN 'Muy Buena'
    when movie_facebook_likes BETWEEN 5000 and 10000 THEN 'Buena'
    ELSE ' Regular' END as 'Calificacion segun Facebook'
FROM imdb_movies
WHERE color = 'Color' and country = 'USA' and title_year BETWEEN 2000 and 2010
order by movie_facebook_likes desc
LIMIT 50


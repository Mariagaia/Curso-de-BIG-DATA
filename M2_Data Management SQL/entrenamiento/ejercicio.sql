SELECT year,
		name,
        publisher, na_sales,eu_sales,other_sales
from videogames_games
	WHERE publisher = 'Nintendo' and year >= 1995 and NOT name = 'Donkey Konga 2' 
    	and eu_sales BETWEEN 0 AND 0.32 and na_sales BETWEEN 0 and 0.31 
        and other_sales BETWEEN 0 and 0.3
order by year
limit 1
-- De la tabla videogames_games, ordenar por año 
--y mostrar resultados del nombre del juego que fue publicado por Nintendo en el año 1995 en adelante,
--que no se llame “Donkey Konga 2”,
--que vendiera entre cero y 0,32 en Europa,
--entre cero y 0,31 en America,
--y entre cero y 0,3 en otros territorios.
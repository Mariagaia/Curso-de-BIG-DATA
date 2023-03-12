--¿Cuántas películas duran menos de 60 minutos?; ¿Cuántas entre 60 y 100? Y
--¿Cuántas más de 100?
select sum (duration <60) as menos_60,
	   sum (duration BETWEEN 60 and 100) as entre60y100,
       sum (duration>100)
from imdb_movies
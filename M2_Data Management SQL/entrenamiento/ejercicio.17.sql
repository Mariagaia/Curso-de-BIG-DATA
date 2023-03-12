-- Cuales son las películas en USA, 
--ordenados de forma descendente por duración en la tabla de imdb_movies.
--añadir el nuevo campo ‘’SON MUY LARGAS’’ a las que duren  de 120 minutos a 200  minutos 
--y ‘’son cortas’’ las que duren menos 120.

SELECT movie_title,country,
case when duration between 120 and 200 then 'son muy largas'
     when duration <120 then 'son muy cortas'

end as son_muy_largas
from imdb_movies
where country='USA'
order by duration DESC
--¿Cuántas películas de acción hay que duren menos de 60 minutos? Haz un listado de las mismas.
select movie_title, duration
   -- count (duration<60 and gender like '%Action%')

from imdb_movies
where gender like '%Action%' and duration<60
group by movie_title
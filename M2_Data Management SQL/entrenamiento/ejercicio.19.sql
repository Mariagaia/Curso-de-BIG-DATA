--Las 50 películas a color de USA,
--desde el año 2000 a 2010 con un campo nuevo llamado 'Calificación según Facebook'
--donde se evidencien tres variables:
--si tiene menos de 5.000 likes es 'Regular'; 
--si tiene entre 5.000 y 10.000 likes es 'Buena'
--y si tiene más de 10.000 likes es 'Muy Buena'.

SELECT movie_title, color, cast_total_facebook_likes,
case when cast_total_facebook_likes <5000 then 'regular'
when cast_total_facebook_likes BETWEEN 5000 and 10000 then 'buena'
when cast_total_facebook_likes > 10000 then 'muy buena'
end as Calificación_según_Facebook
from imdb_movies
where color= 'Color'
limit 50
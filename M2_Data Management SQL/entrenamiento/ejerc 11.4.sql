--Mostrar el conteo de las películas relacionadas con los géneros (Action, Crime,
--Comedy, Drama, Romance), indicando la película con mayor número de votos
--en cada caso (num_voted_users).
SELECT 
case when gender like '%Action%' then 'action'
	  when gender like '%Crime%' then 'crime'
 	 when gender like '%Comedy%' then' comedy '
  	when gender like '%Drama%' then' drama ' 
	when gender like '%Romance%' then 'romance '
    else 'otros'end as generos,
  count (movie_title) as numero_pelis,
  case when max(num_voted_users) then movie_title end as peli_ma_votada,
  num_voted_users
  
from imdb_movies 
group by generos
having generos <> 'otros'
order by numero_pelis desc



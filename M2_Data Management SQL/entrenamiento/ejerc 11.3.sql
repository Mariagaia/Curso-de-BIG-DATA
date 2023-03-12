SELECT 
case when gender like '%Action%' then 'action'
	  when gender like '%Crime%' then 'crime'
 	 when gender like '%Comedy%' then' comedy '
  	when gender like '%Drama%' then' drama ' 
	when gender like '%Romance%' then 'romance '
    else 'otros'end as generos,
  count (movie_title) as numero_pelis,
  case when num_voted_users = max(num_voted_users) then movie_title end as peli_ma_votada,
  max(num_voted_users) as num_votos
  
from imdb_movies 
group by generos
having generos <> 'otros'
order by numero_pelis desc

select 
CASE WHEN gender LIKE '%Action%' THEN 'Action_movies' else 'resto' end as genERO,
COUNT(movie_title),ROUND( AVG (imdb_score),2)
from imdb_movies
GROUP BY genERO

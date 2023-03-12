select 
CASE WHEN gender LIKE '%Action%' THEN 'Action_movies' else 'resto' end as genERO,
COUNT(movie_title), AVG (imdb_score)
from imdb_movies
GROUP BY genERO

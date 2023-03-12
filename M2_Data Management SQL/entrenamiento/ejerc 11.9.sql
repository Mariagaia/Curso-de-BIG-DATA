--Queremos saber cuáles son las 20 películas y género al que pertenecen,
-- 1) con mayor presupuesto
-- 2) con mayor beneficio
SELECT movie_title,gender, budget, gross
from imdb_movies
order by budget DESC-- para hacer la segunda parte habría que cambiar por gross desc
limit 20

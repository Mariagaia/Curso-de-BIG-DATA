--Obtén un listado de las películas de acción con actor protagonista con más de
--10000 likes en Facebook y cuyas películas hayan sido valoradas con al menos
--un 8 en imdb. Todo ello con fechas anteriores a 2012.
SELECT movie_title,
	actor_1_facebook_likes,
	imdb_score, title_year

from imdb_movies
where actor_1_facebook_likes>10000 and imdb_score>= 8 and title_year <2012 and gender like '%Action%'

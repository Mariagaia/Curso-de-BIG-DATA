--De la tabla imdb_movies
--Cuales son las 10 películas que tienen mayor puntuación de imdb, 
--y de esas 10 cuáles son las de mayor número de votos de los usuarios.
--Visualizar solo las que no sean western.
--Crea un campo que clasifique las películas por su número de votos de usuarios
--que se llame “votos” 
--donde si tiene más de 7 se llamen top, 
--si tienen entre 5 y 7  se llamen se puede ver 
--y si es menos que se llame no pierdas el tiempo.



SELECT movie_title, imdb_score,num_voted_users,gender,
case when num_voted_users >7 then 'top'
	when num_voted_users BETWEEN 5 and 7 then'se pueden ver'
    else 'no pierdas el tiempo'
    end as votos 
    
FROM imdb_movies
where gender not like '%Western%'
order by imdb_score desc, num_voted_users DESC

limit 10

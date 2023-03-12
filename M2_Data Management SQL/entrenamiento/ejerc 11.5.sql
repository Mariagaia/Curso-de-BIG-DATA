--Mostrar el número de personajes que tienen el mismo color de ojos (eye_color)
--y el planeta de origen (homeworld). No mostrar color de ojos desconocidos
--(unknown) ni planetas sin datos/nombre (NA).

SELECT eye_color,
	homeworld,
	count (name)
from star_wars_characters_2
where eye_color <> 'unknown' and homeworld<> 'NA'
group by eye_color,homeworld
having count(name)>1
order by 3 DESC
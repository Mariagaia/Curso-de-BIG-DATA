--Partiendo de la tabla star_wars_characters,
--crea una nueva columna denominada “personajes chachis”, 
--en la cual, los personajes que tengan el pelo de color brown, serán los molones y
--los que no tengan pelo, serán no molones.
--Una vez determinados qué personajes son los que molan, buscar al mejor,
--en base a los siguientes parámetros:
--El nombre de su planeta de origen empieza por “k” y su nombre contenga la letra “w”

SELECT name, hair_color, homeworld,
case when hair_color='brown' then 'molones'
else 'no molones'
end as personajes_chachis
from star_wars_characters_2
where homeworld like 'k%' and name like '%w%' and personajes_chachis='molones'
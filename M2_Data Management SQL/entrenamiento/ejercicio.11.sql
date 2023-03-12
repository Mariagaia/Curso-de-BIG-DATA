--Tabla: star_wars_characters.
--Nombre de los personajes de Star Wars 
--que tengan los ojos distintos a rojo y 
--que sean de los mundos Chandrila, Stewjon o Tatooine.
--Añadir un nuevo campo “tamaño” que nos diga
--si es “grande” cuando la altura  sea mayor o igual a 200 y 
--“pequeño” si es menor de 200. 
--Por último ordenar por altura de menor a mayor.

SELECT name, eye_color,homeworld,height,
case when height >=200 then 'grande'
	else 'pequeño'
    end as 'tamaño'

FROM star_wars_characters_2
WHERE eye_color<> 'red'and homeworld in ('Chandrila','Stewjon','Tatooine')
ORDER BY height
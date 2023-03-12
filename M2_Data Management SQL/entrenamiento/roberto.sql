--Lista de personajes de Star Wars sin contar a los rubios,
--que no midan más de 200 de altura y no sean naturales de Kashyyyk. 
--Aparte, crear un nuevo campo que especifique su alineamiento según el color de sus ojos
--(azul = bueno, rojo = malo). 
--Partiendo de la idea de que todos los droides son neutrales 
--sin importar el color de sus ojos.

select name, hair_color,eye_color, height,
case when eye_color ='blue' then 'bueno'
	when eye_color = 'red' then 'malo'
    end as alineamiento
    
from star_wars_characters_2
WHERE hair_color <>'blond' and height <=200 and homeworld <>'Kashyyyk'
order by alineamiento
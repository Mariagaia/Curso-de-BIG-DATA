--De la tabla starstar_wars_characters_2.
--Mostrar los personajes que sean humanos, hutt, wookie o ewok 
--con peso no nulo ordenando por peso de mayor a menor.
--Añadir un nuevo campo 'Recomendación de la abuela'
--dónde se indique que si pesan más de 1000 necesitan comer más lechuga, 
--si su peso está entre 90 y 1000 están fuertes
--y si pesan menos de 90 necesitan comer más.

SELECT name,species,mass,
case WHEN mass >1000 then 'necesitan comer más lechuga'
	when mass BETWEEN 90 and 1000 then 'están fuertes'
    when mass < 90 then 'necesitan comer más'
    end as recomendacion_de_la_abuela
    
from star_wars_characters_2
    where mass notnull and species in('Human','Hutt','Wookie','Ewok')
    order by mass DESC
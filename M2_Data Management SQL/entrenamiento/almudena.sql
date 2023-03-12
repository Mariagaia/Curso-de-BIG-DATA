--De la tabla stars_war_characters, 
--clasificar como ‘Guapo’ a los que tenga pelo rubio y ojos azules. 
--El resto serán ‘sin interés’ en una categoría denominada Clasificación.
--Seleccionar los que tengan una altura entre 170 y 190 y sean humanos.

select name,eye_color,hair_color, height, species,
case when eye_color='blue' and hair_color='blond' then 'guapo'
else 'sin interés'
end as clasificación

from star_wars_characters_2
where height BETWEEN 170 and 190 and species='Human'
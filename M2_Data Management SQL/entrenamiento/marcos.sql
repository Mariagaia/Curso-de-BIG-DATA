--En la tabla StarWars , 
--qué personajes femeninos de Tatooine existen cuyo tipo de pelo comience con la letra “b”
--y tengan altura superior a 140 ?
--(Crea adicionalmente una columna que indique “Mujeres de Tatooine” 
-- en los casos en los que aplique y “Otros” para el resto) .
 
 SELECT name,gender,homeworld, hair_color,height,
 case when homeworld = 'Tatooine' then 'Tatooine'
 	else 'otros'
 
 end as mujeres_de_tatooine
 from star_wars_characters_2
 where gender ='female' and homeworld ='Tatooine'
 and hair_color like 'b%' and hair_color like 'B%' and height>140
 
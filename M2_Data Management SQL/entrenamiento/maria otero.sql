--En la tabla star_wars_characters, 
--Establecer los personajes femeninos humanos ordenados por el nombre que no pertenezcan a Naboo y no tengan los ojos azules.
--Establecer una nueva columna “COINCIDENCIAS” donde si coinciden el color de pelo y de ojos indique “iguales” y en caso contrario indique “distintos”
--(pista, solo pueden quedar tres)
 select name, species, homeworld,gender,eye_color,hair_color,
 case when eye_color=hair_color then 'iguales'
 	ELSE 'distintos'
    end as coincidencias
    from star_wars_characters_2
    where species='Human' and gender ='female' and homeworld <> 'Naboo' and eye_color <>'blue' 
    order by name
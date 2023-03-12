--De la tabla videogames_games,
--mostrar juegos de Playstation que el nombre no contenga “Jampack”. 
--Ordenar por año de mayor a menor. 
--Teniendo en cuenta la editora,
--mostrar una columna nueva que indica si fue publicado por “Sony” o “otros”.
 
 SELECT name,year,publisher,
 
 CASE WHEN publisher LIKE '%Sony%' then 'Sony'
 		else 'otros'
 end as editora 
 FROM videogames_games
WHERE platform_code='PS'AND name not like ('%Jampack%')
 order by year desc
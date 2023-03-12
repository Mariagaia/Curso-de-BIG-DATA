 --En la tabla videogames_consoles, 
 --traer todas las consolas y clasificarlos en función de sus ventas,
 --Si una consola ha vendido menos de 30 millones de unidades, se etiqueta como "Bajo". 
 --Si ha vendido entre 30 y 60 millones de unidades, se etiqueta como "Medio".
 --Si ha vendido más de 60 millones de unidades, se etiqueta como "Alto", 
 --por último ordenar por el nombre de la consola alfabéticamente 
 --además de no incluir las consolas que empiecen por números. 
-- La consulta devuelve el nombre de la consola y su clasificación de ventas correspondiente.
 
 select console_name,units_sold_million,
CASE WHEN units_sold_million < 30 then 'Bajo'
	when units_sold_million BETWEEN 30 and 60 then 'Medio'
    when units_sold_million > 60 then 'Alto'
    end as ventas
    
 from videogames_consoles
 where console_name not like '0%' AND console_name not like '1%' and 
  		console_name not like '2%' AND console_name not like '3%'and console_name not like '4%' 
        AND console_name not like '5%'  AND console_name not like '6%'  AND console_name not like '7%'
         AND console_name not like '8%'  AND console_name not like '9%'
 order by console_name
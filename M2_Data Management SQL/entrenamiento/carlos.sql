--Ordenar todos los álbumes que contengan la letra W 
--y se sacaran entre los años 1975 y 2001 
--según la paciencia del público para ello crear un campo que se denomine 
--Paciencia del público en el que los álbumes con más duración de 50 minutos sea “ADECUADO”, 
--entre 51 y 70 sea “SOPORTABLE”, más de 70 sea “INSOPORTABLE” y lo demás “IDEAL”.  

SELECT album, release_year,duration,minutes,
case when minutes >70 then ' insoportable'
	WHEN minutes  = 50 then 'adecuado'
	when minutes  BETWEEN 51 and 70 then 'soportable'
    else 'ideal'
end as paciencia_del_publico
from rolling_top_albums_1
where release_year BETWEEN 1975 and 2001 and album like '%w%'
order by paciencia_del_publico
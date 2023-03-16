--De la tabla fortune, mostrar las Empresas Medianas ordenadas por ranking, siguiendo los siguientes criterios de clasificación 
--según número de empleados y beneficios (filtrando los valores nulos):
--Si la empresa tiene más de 500 empleados, es una Empresa Grande
--Si la empresa tiene entre 50 y 500 empleados, es una Empresa Mediana
--Si la empresa tiene menos de 50 empleados, es una Empresa Pequeña
--Si la empresa tiene beneficios, es Con Beneficios
--Si la empresa NO tiene beneficios, es Con Pérdidas.

SELECT rank,employees,profits,
 CASE WHEN employees >500 THEN 'Empresa Grande'
 		when employees BETWEEN 50 and 500 then 'Empresa Mediana'
        WHEN employees <50 then 'Empresa Pequeña'
        end as tamaño_empresa,
        
 CASE when profits >0 then 'Con Beneficios'
 	else'Con Pérdidas'
    end as rentabilidad
FROM fortune
WHERE employees notnull and profits NOTNULL and tamaño_empresa='Empresa Mediana'
order by rank 



--De la tabla stars_war_characters, clasificar como ‘Guapo’ a los que tenga pelo rubio y ojos azules. 
--El resto serán ‘sin interés’ en una categoría denominada Clasificación.
--Seleccionar los que tengan una altura entre 170 y 190 y sean humanos.

select name,eye_color,hair_color, height, species,
case when eye_color='blue' and hair_color='blond' then 'guapo'
else 'sin interés'
end as clasificación

from star_wars_characters_2
where height BETWEEN 170 and 190 and species='Human'



--De la tabla starstar_wars_characters_2.
--Mostrar los personajes que sean humanos, hutt, wookie o ewok con peso no nulo ordenando por peso de mayor a menor.
--Añadir un nuevo campo 'Recomendación de la abuela'dónde se indique que si pesan más de 1000 necesitan comer más lechuga, 
--si su peso está entre 90 y 1000 están fuertes y si pesan menos de 90 necesitan comer más.

SELECT name,species,mass,
case WHEN mass >1000 then 'necesitan comer más lechuga'
	when mass BETWEEN 90 and 1000 then 'están fuertes'
    when mass < 90 then 'necesitan comer más'
    end as recomendacion_de_la_abuela
    
from star_wars_characters_2
    where mass notnull and species in('Human','Hutt','Wookie','Ewok')
    order by mass DESC
    
    
    
--Tabla, world_health_org ordena alfabéticamente de forma descendente los 5 paises que cumplan:
-- Pertenezcan a EN VIAS DE DESARROLLO  más de 30 millones de habitantes que no acabe en "a"
--Para ello se debe crear un nuevo campo llamado grado_desarrollo que se asigne del siguiente modo:
-- EN VIAS DE DESARROLLO: PIB <5000 $ y tasa de fertilidad > 50
-- DESARROLLADOS: PIB > 10000 $ y tasa de fertilidad <20

SELECT country,gross_income_per_capita, adolescent_fertility_rate,
case when gross_income_per_capita <5000 and adolescent_fertility_rate >50 then 'en vias de desarrollo'
     when gross_income_per_capita >10000 and adolescent_fertility_rate<20 then 'desarrollados'

end as grado_desarrollo

FROM world_health_org
where grado_desarrollo= 'en vias de desarrollo' and population_in_thousands >30 and country NOT like '%a'
order by country desc



--Lista de personajes de Star Wars sin contar a los rubios, que no midan más de 200 de altura y no sean naturales de Kashyyyk. 
--Aparte, crear un nuevo campo que especifique su alineamiento según el color de sus ojos (azul = bueno, rojo = malo). 
--Partiendo de la idea de que todos los droides son neutrales sin importar el color de sus ojos.

select name, hair_color,eye_color, height,
case when eye_color ='blue' then 'bueno'
	when eye_color = 'red' then 'malo'
    end as alineamiento
    
from star_wars_characters_2
WHERE hair_color <>'blond' and height <=200 and homeworld <>'Kashyyyk'
order by alineamiento



--En la tabla ‘fortune’ mostrar todas las compañías que pertenezcan al sector chemicals
--y que estén localizados en los puestos entre 700 y 900 del ranking ordenados de forma descendente.
--Crear un campo número_empleados en el cual si el número de empleados es mayor de 6000
--se añadirá un campo que ponga ‘muchos empleados’ y, en caso contrario, pondrá ‘pocos empleados’.
 select company,sector, rank,employees,
 CASE when employees>6000 then 'muchos empledos'
 else 'pocos empleados'
 
 end as numero_empleados
  
 from fortune
 where sector='Chemicals' and rank BETWEEN 700 and 900
 order by rank DESC
 
 
--De la tabla Loan-Data filtrar los clientes dueños de su propio hogar, que posean ahorros y sean altamente calificados laboralmente. 
--Crear la columna 'Potencial Hipotecario' donde según el nivel de ahorros sea 
--'Bajo'cuando sus ahorros sean inferiores a 100,
--'Medio' cuando sus ahorros sean entre 100 y 500, 
--'Alto' cuando sus ahorros sean entre 500 y 1000 y 
--'Muy Alto' cuando sus ahorros sean mayor o igual a 1000.

SELECT job, savings_status,housing, 
CASE WHEN savings_status = '<100' then 'bajo'
	when savings_status = '100<=X<500' then 'medio'
    when savings_status ='500<=X<1000' then 'alto'
    when savings_status ='>=1000' then 'muy alto'
    end as Potencial_Hipotecario
FROM LoanData
WHERE savings_status <> 'no known savings' and job ='high qualif/self emp/mgmt' and housing ='own'



 --En la tabla videogames_consoles, traer todas las consolas y clasificarlos en función de sus ventas,
 --Si una consola ha vendido menos de 30 millones de unidades, se etiqueta como "Bajo". 
 --Si ha vendido entre 30 y 60 millones de unidades, se etiqueta como "Medio".
 --Si ha vendido más de 60 millones de unidades, se etiqueta como "Alto", 
 --por último ordenar por el nombre de la consola alfabéticamente además de no incluir las consolas que empiecen por números. 
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
 
 
 
--Ordenar todos los álbumes que contengan la letra W y se sacaran entre los años 1975 y 2001 
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


--De la tabla gobierno_paro mostrar la cantidad de paro en los 
--sectores agricultura, industria, construcción y servicios en el mes Enero 
--ordenados por municipio, creando un campo comparacion_de_paro 
--indicando si el total es mayor de 1000 como “alto” mayor de 500 “medio” y menor de 500 “bajo”

SELECT paro_agricultura,paro_industria,paro_construcci__n,paro_servicios,
case when total_paro_registrado >1000 then 'alto'
	when total_paro_registrado >500 then 'medio'
    when total_paro_registrado <500 THEN 'bajo'
    end as comparacion_de_paro
from gobierno_paro
where mes LIKE 'Enero%'
order by municipio


--De la tabla Loan-Data, se desea obtener la lista de personas que tengan
--un Crédito con una duración mayor o igual a 12 meses,
--que haya sido usado para comprar un “coche nuevo”,
--que sea “hombre soltero” y cuya edad sea mayor a 25 años.
--Se requiere además que cuando el monto de crédito sea mayor o igual a 6000 diga “Buen Crédito”,
--cuando sea mayor a 4000 diga “Crédito Aceptable” 
--y cuando sea mayor a 2000 diga “Crédito Bajo” en un campo nuevo llamado “Tipo de Crédito”.
SELECT personal_status, purpose, duration, age, credit_amount,
case when credit_amount>= 6000 then 'buen crédito'
	when credit_amount>4000 then 'credito aceptable'
    when credit_amount>2000 then 'credito bajo'
    end as tipo_de_credito

from LoanData
where duration >=12 and purpose ='new car' and age >25 and personal_status>25


--De la tabla videogames_games, mostrar juegos de Playstation que el nombre no contenga “Jampack”. 
--Ordenar por año de mayor a menor. Teniendo en cuenta la editora,
--mostrar una columna nueva que indica si fue publicado por “Sony” o “otros”.
 
 SELECT name,year,publisher,
 
 CASE WHEN publisher LIKE '%Sony%' then 'Sony'
 		else 'otros'
 end as editora 
 FROM videogames_games
WHERE platform_code='PS'AND name not like ('%Jampack%')
 order by year desc
 
 
 --En la tabla jamesbond otórgale otro nombre a los campos Year y Film.
--Muestra el nombre de las películas que no estén dirigidas por Lewis Gilbert
--y se hayan estrenado entre 1960 y 2002.
--Añade un campo ‘Presupuesto’ donde si este es mayor o igual a 500 lo nombres como ‘Presupuesto alto’
--y en el caso de ser menor a 500 como ‘Presupuesto medio’. Ordena alfabéticamente el título de la película.

select year as año,film as pelicula, budget,
case WHEN budget >=500 then 'presupuesto alto'
 	when budget < 500 then 'presupuesto medio'
end as presupuesto
from jamesbond
where director <> 'Lewis Gilbert' and year BETWEEN 1960 and 2002

order by film



--Ordena de menos a más los días del año 2017 que el bitcoin ha abierto por debajo de 3000. 
--Separa en otro grupo si el volumen de btc es mayor de 10000 como mercado btc
--y si el volumen de usd es mayor de 10 millones como mercado USD. 
--Si no es ninguno marcalo como mercado dividido.

select date, open, volume_btc,volume_usd,
case when volume_btc<10000 then 'mercado btc'	
	when volume_usd>10000000 then 'mercado usd'
    else 'mercado dividido'
end as mercado
from bitcoin_daily_rates_formatdate
where date like '2017%' and open<3000
order by date



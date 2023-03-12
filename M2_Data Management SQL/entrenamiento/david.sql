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
--De la tabla gobierno_paro mostrar la cantidad de paro en los 
--sectores agricultura, industria, construcción y servicios en el mes Enero 
--ordenados por municipio, 
--creando un campo comparacion_de_paro 
--indicando si el total es mayor de 1000 como “alto” mayor de 500 “medio” y menor de 500 “bajo”

SELECT paro_agricultura,paro_industria,paro_construcci__n,paro_servicios,
case when total_paro_registrado >1000 then 'alto'
	when total_paro_registrado >500 then 'medio'
    when total_paro_registrado <500 THEN 'bajo'
    end as comparacion_de_paro
from gobierno_paro
where mes LIKE 'Enero%'
order by municipio
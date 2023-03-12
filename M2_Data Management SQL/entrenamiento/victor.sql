
--De la tabla fortune, mostrar las Empresas Medianas ordenadas por ranking, 
--siguiendo los siguientes criterios de clasificación según número de empleados y beneficios 
--(filtrando los valores nulos):
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
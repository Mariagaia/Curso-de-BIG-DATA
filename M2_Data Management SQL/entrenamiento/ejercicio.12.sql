-- De la tabla fortune,
--queremos ver sólo las 100 primeras compañías según el rango, 
--sin incluir a Citigroup, 
--viendo sólo las compañías dentro del sector financiero;
--industria diversified financials y 
--crearemos un nuevo campo de rentabilidad en el que 
--divida a las compañías entre rentables y no rentables si sus beneficios son mayores o menores a 1000.

SELECT rank,company,industry,revenue,sector,
case when profits>1000 then 'rentables'
	else 'no_rentables'
	end as rentabilidad

from fortune
where  sector= 'Financials' and company <> 'Citigroup'and industry='Diversified Financials'
limit 100

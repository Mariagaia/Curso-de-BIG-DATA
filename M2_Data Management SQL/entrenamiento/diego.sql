--Tabla, world_health_org
--ordena alfabéticamente de forma descendente los 5 paises que cumplan:
-- Pertenezcan a EN VIAS DE DESARROLLO
-- más de 30 millones de habitantes
-- que no acabe en "a"

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
SELECT round(avg(gross_income_per_capita),2) as avg_pib, --ROUN redondea a 2
	sum(population_in_thousands) AS total_habitantes, 
    count (country), continent
 
    from world_health_org
   --  where continent='Africa'
   GROUP BY (continent)





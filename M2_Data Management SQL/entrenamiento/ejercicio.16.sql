--En la tabla videogames_games, 
--queremos ver los nombres de los juegos de platform_code ‘DS’
--y años ordenados por año, 
--con las ventas en las tres regiones principales (NA, EU y JP). 
--Teniendo en cuenta sólo estas regiones (ignorar other_sales), 
--queremos determinar en qué región ha vendido mejor cada juego. 
--Para ello, generar un campo nuevo best_selling_region cuyo valor sea ‘NA’,
--si NA_sales es mayor que EU_sales y que JP_sales; 
--‘EU’ en caso de que EU_sales sea mayor que NA_sales y JP_sales o ‘JP’ en el el tercer caso.

select name, year,na_sales,eu_sales,jp_sales,
CASE WHEN na_sales>eu_sales and na_sales>jp_sales then 'na'
      WHEN eu_sales>na_sales and eu_sales>jp_sales then 'eu'
      else 'jp'

end as best_selling_region
FROM videogames_games
order by year
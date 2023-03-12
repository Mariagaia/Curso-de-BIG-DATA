 -- CONSOLAS
-- select  platform_code, console_name, discontinued from videogames_consoles where not discontinued <>""
--group by platform_code

-- GAMES
--select platform_code, sum(na_sales+ eu_sales+jp_sales+other_sales) as ventasglobales, year > 2000 
--from videogames_games
--group by platform_code
--order by ventasglobales

--campo comun platform_code

SELECT conso.console_name, 
		conso.first_retail_availability, 
        conso.discontinued,
        round(sum(game.na_sales+ game.eu_sales+game.jp_sales+game.other_sales),0) as ventasglobales
FROM videogames_consoles conso

INNER JOIN videogames_games game ON conso.platform_code = game.platform_code
where  conso.discontinued not like '' and game.year >= 2000 
GROUP BY conso.platform_code
ORDER BY ventasglobales desc;

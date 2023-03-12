SELECT homeworld, count (name) as count_characters FROM star_wars_characters_2
where homeworld<> 'NA'
group by homeworld -- TAMBIÉN PODRÍA PONER 1
--HAVING homeworld <> 'NA'esta sería otra opción
order by 2 DESC
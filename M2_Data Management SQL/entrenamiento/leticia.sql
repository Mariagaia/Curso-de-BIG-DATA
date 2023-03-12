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

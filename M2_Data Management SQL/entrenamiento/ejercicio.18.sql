--De la tabla gobierno_paro, 
--cuál es la cifra de mujeres de 45 años que estaban en paro,
--donde la cifra de parados sin empleo anterior era cero,
--durante el mes de marzo de 2018, 
--ordenado por municipios por órden alfabético descendente.

SELECT paro_mujer_edad___45, paro_sin_empleo_anterior, mes

from gobierno_paro
where paro_sin_empleo_anterior=0 and mes= 'Marzo de 2018'
order by municipio DESC
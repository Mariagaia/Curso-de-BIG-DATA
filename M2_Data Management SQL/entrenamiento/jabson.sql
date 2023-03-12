--De la tabla Loan-Data, se desea obtener la lista de personas que tengan
--un Crédito con una duración mayor o igual a 12 meses,
--que haya sido usado para comprar un “coche nuevo”,
--que sea “hombre soltero” y cuya edad sea mayor a 25 años.
--Se requiere además que cuando el monto de crédito sea mayor o igual a 6000 diga “Buen Crédito”,
--cuando sea mayor a 4000 diga “Crédito Aceptable” 
--y cuando sea mayor a 2000 diga “Crédito Bajo” en un campo nuevo llamado “Tipo de Crédito”.
SELECT personal_status, purpose, duration, age, credit_amount,
case when credit_amount>= 6000 then 'buen crédito'
	when credit_amount>4000 then 'credito aceptable'
    when credit_amount>2000 then 'credito bajo'
    end as tipo_de_credito

from LoanData
where duration >=12 and purpose ='new car' and age >25 and personal_status>25
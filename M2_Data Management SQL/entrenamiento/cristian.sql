--De la tabla Loan-Data filtrar los clientes dueños de su propio hogar,
--que posean ahorros y sean altamente calificados laboralmente. 
--Crear la columna 'Potencial Hipotecario' donde según el nivel de ahorros sea 
--'Bajo'cuando sus ahorros sean inferiores a 100,
--'Medio' cuando sus ahorros sean entre 100 y 500, 
--'Alto' cuando sus ahorros sean entre 500 y 1000 y 
--'Muy Alto' cuando sus ahorros sean mayor o igual a 1000.

SELECT job, savings_status,housing, 
CASE WHEN savings_status = '<100' then 'bajo'
	when savings_status = '100<=X<500' then 'medio'
    when savings_status ='500<=X<1000' then 'alto'
    when savings_status ='>=1000' then 'muy alto'
    end as Potencial_Hipotecario
FROM LoanData
WHERE savings_status <> 'no known savings' and job ='high qualif/self emp/mgmt' and housing ='own'
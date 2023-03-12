--Identificar y calcular el presupuesto de aquellas películas de James Bond que
--fueron dirigidas por John Glen y protagonizadas por Timothy Dalton.

select director, actor , film, budget


from jamesbond
where director='John Glen' and actor='Timothy Dalton'
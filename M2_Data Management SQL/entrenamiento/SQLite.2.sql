select bond_actor_salary,actor, ROUND(SUM(bond_actor_salary),2)
from jamesbond
group by actor
HAVING SUM(bond_actor_salary)>0
ORDER BY 3 DESC
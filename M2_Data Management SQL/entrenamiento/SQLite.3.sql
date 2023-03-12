select box_office,director, ROUND(SUM(box_office),1) as total_box_office
from jamesbond
group by director
HAVING SUM(box_office)>1500
ORDER BY ROUND(SUM(box_office),1) DESC
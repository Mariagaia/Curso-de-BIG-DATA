select sub_metal_genre, COUNT(album)
from rolling_top_albums_1
group by sub_metal_genre
HAVING COUNT(album)>=10
ORDER BY COUNT(album) DESC
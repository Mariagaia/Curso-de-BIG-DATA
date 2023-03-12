select 
CASE WHEN artist LIKE '%god%' THEN 'GOD'
	 when artist LIKE '%death%' THEN 'BAD'
     when artist LIKE '%black%' THEN 'BLACK' end as artist_keyword,
 
COUNT(DISTINCT artist)
from rolling_top_albums_1
WHERE artist_keyword NOTNULL
GROUP BY artist_keyword
--having artist_keyword NOTNULL
ORDER BY 2 DESC
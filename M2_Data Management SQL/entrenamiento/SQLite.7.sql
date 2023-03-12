SELECT channelgrouping,
SUM(CASE WHEN devicecategory ='mobile' then sessions end )as movile_sessions,
SUM(CASE when devicecategory='desktop' then sessions END )AS descktop_sessions,
SUM(CASE  when devicecategory='tablet' then sessions end )as tablet_sessions,
sum (sessions) as total_sessions
 
  
FROM google_analytics_formatdate
where strftime('%m',date)='10'and strftime('%Y',date)='2019'
GROUP BY channelgrouping
order by 5 DESC
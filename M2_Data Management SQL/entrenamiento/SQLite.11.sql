--¿Cuál sería el día de menos cotización en una tendencia alcista en el año 2018?; 
--¿Y la media ese mismo día?
select 
 min(high), date

from bitcoin_daily_rates_formatdate
where  STRFTIME('%d', Date) and strftime ('%Y',date)='2018'

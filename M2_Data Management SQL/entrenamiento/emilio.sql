--Ordena de menos a más los días del año 2017 que el bitcoin ha abierto por debajo de 3000. 
--Separa en otro grupo si el volumen de btc es mayor de 10000 como mercado btc
--y si el volumen de usd es mayor de 10 millones como mercado USD. 
--Si no es ninguno marcalo como mercado dividido.

select date, open, volume_btc,volume_usd,
case when volume_btc<10000 then 'mercado btc'	
	when volume_usd>10000000 then 'mercado usd'
    else 'mercado dividido'
end as mercado
from bitcoin_daily_rates_formatdate
where date like '2017%' and open<3000
order by date

SELECT
	STRFTIME('%m', date) as mes,
    STRFTIME('%Y', date) as año,
    round(AVG(open),2)as media_apertura,
    round(avg(volume_usd),2) as volumen_op_usd

FROM bitcoin_daily_rates_formatdate
group by año , mes
HAVING año >= '2016'

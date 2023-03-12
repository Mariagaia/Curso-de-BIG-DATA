--¿Cuál es el monto de los créditos otorgados y no otorgados según el Status personal?
select 
DISTINCT 
SUM (CASE WHEN personal_status='female div/dep/mar' then credit_amount end) as fem_div_dep_mar,
SUM (CASE WHEN personal_status='male single' then credit_amount end) as male_single,
SUM (CASE WHEN personal_status='male div/sep' then credit_amount end) as male_div_sep,
SUM (CASE WHEN personal_status='male mar/wid' then credit_amount end) as male_mar_wid
from LoanData
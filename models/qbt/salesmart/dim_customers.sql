{{config(materialized= 'view', schema= env_var('DBT_SALESMART','SALESMART'))}}

select c.*,
d.divisionname
from
{{ref('trf_customers')}} as c
inner join 
{{ref('divisions')}} as d
on c.divisionid=d.divisionid
{{ config(materialized='view',schema=env_var('DBT_REPORTSCHEMA','REPORTING')) }}

select e.firstname,
od.ordermonth,
od.orderyear,o.officecity,
sum(od.linesalesamount) as totalsales,
avg(od.freight) as profit
from
{{ ref('stg_employee')}} as e
inner join {{ ref('stg_office') }} as o
on e.office=o.office

inner join {{ ref('fact_orders') }} as od
on od.employeeid=e.empid

where o.officecity='{{ var('city', 'Lund') }}'

group by e.firstname,od.ordermonth,od.orderyear,o.officecity

order by totalsales desc

limit 10

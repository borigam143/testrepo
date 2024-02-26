{{ config(materialized='table',schema="env_var('DBT_TRANSFORMDB','TRANSFORMING')",sql_header='use warehouse DATALOAD;') }}

select 
e.empid,e.firstname,e.lastname,e.title,replace(e.hiredate,'-','/')::date as hiredate,o.officecity
,concat(COALESCE(se.lastname,''),' ',COALESCE(se.firstname,'')) as managername,e.yearsalary
--,se.reportsto,se.lastname as sename
--e.*,se.*
from 

{{ ref('stg_office') }} o
inner join
{{ ref('stg_employee') }} e
on o.office=e.office
left join {{ ref('stg_employee') }} se
on to_varchar(COALESCE(e.reportsto,''))=to_varchar(se.empid)
order by e.empid


{{ config(materialized='table',schema="env_var('DBT_TRANSFORMDB','TRANSFORMING')") }}

select od.*
,(p.unitprice*quantity)*(1-discount) as linesalesamount1

from {{ref('stg_orderdetails')}} od
inner join {{ref('stg_products')}} p 
on od.productid=p.productid
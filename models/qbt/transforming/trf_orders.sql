{{ config(materialized='table',schema=env_var('DBT_TRANSFORMDB','TRANSFORMING')) }}

select productid,
orderdate,
month(orderdate) as ordermonth,
year(orderdate) as orderyear,
customerid,
employeeid,
shipperid,
freight

from {{ref('stg_orders')}}
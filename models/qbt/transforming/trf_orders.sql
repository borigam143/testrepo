{{ config(materialized='table',schema='transforming') }}

select productid,
orderdate,
month(orderdate) as ordermonth,
year(orderdate) as orderyear,
customerid,
employeeid,
shipperid,
freight

from {{ref('stg_orders')}}
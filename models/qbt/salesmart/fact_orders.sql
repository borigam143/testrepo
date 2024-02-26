{{config(materialized= 'view', schema= 'salesmart')}}

select d.*
,c.orderdate,
c.orderyear,
c.ordermonth,
c.customerid,
c.employeeid,
c.freight,
d.linesalesamount1 as linesalesamount
from
{{ref('trf_orders')}} as c
inner join 
{{ref('trf_orderdetails')}} as d
on c.productid=d.orderid
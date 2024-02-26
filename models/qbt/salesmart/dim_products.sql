{{config(materialized= 'view', schema= 'salesmart')}}


select
ts.companyname,tp.ProductName,c.categoryname,c.description,ts.contactname,ts.address,ts.city,ts.Country
,tp.QuantityPerUnit,tp.unitcost,tp.unitprice,tp.UnitsInStock,tp.UnitsOnOrder,
tp.productavailability,tp.profit
from

{{ ref("trf_products")}} as tp
inner join 
{{ ref("categories")}} as c
on c.CategoryID=tp.CategoryID
inner join
{{ ref("trf_suppliers")}} as ts
on ts.supplierid=tp.supplierid

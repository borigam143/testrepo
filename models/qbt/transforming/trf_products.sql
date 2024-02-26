{{ config(materialized='table',schema='transforming') }}

select ProductID,
ProductName,
SupplierID,
CategoryID,
QuantityPerUnit,
UnitCost,
UnitPrice,
UnitsInStock,
UnitsOnOrder
--,case when (unitsinstock-UnitsOnOrder)>0 then 'YES' else 'NO' end as productavailability
,IFF((unitsinstock-UnitsOnOrder)>0,'YES','NO') as productavailability,
to_double(unitprice-unitcost) as profit

from 

{{ ref('stg_products') }}
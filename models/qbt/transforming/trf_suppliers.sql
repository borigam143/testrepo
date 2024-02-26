{{ config(materialized='table',schema='transforming') }}

select
get(xmlget(supplierinfo,'SupplierID'),'$')::varchar as supplierid, 
get(xmlget(supplierinfo,'CompanyName'),'$')::varchar as companyname,
get(xmlget(supplierinfo,'ContactName'),'$')::varchar as contactname,
get(xmlget(supplierinfo,'Address'),'$')::varchar as address,
get(xmlget(supplierinfo,'City'),'$')::varchar as city,
get(xmlget(supplierinfo,'PostalCode'),'$')::varchar as postalcode,
get(xmlget(supplierinfo,'Country'),'$')::varchar as Country,
get(xmlget(supplierinfo,'Phone'),'$')::varchar as Phone,
get(xmlget(supplierinfo,'Fax'),'$')::varchar as Fax
from 

{{ ref("stg_supplier") }}
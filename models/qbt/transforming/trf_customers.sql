{{ config(materialized='table',schema=env_var('DBT_TRANSFORMDB','TRANSFORMING'),sql_header='use warehouse DATALOAD;') }}

select customerid,
companyname,
contactname,
city,country,
divisionid,
address,
fax,
phone,
postalcode,
CASE when stateprovince='' then 'n/a' ELSE stateprovince END as stateprovince

from 

{{ ref('stg_customers') }}


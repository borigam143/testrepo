{{ config(materialized='table')}}

select *
from
{{ env_var('DBT_SOURCEDB','QBT')}}.{{env_var('DBT_SOURCESCHEMA','RAW')}}.supplier_xml
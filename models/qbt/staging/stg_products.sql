{{ config(materialized='table', sort='productid')}}

select * from
{{env_var('DBT_SOURCEDB','QBT')}}.{{env_var('DBT_SOURCESCHEMA','RAW')}}.products
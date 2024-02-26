{{ config(materialized='table', sort='customerid')}}

select * from
{{ env_var('DBT_SOURCEDB','QBT')}}.{{env_var('DBT_SOURCESCHEMA','RAW')}}.Customers
--QBT.RAW.Customers
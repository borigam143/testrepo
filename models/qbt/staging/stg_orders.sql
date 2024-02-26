{{ config(materialized='incremental', unique_key='productid')}}

select * from
{{env_var('DBT_SOURCEDB','QBT')}}.{{env_var('DBT_SOURCESCHEMA','RAW')}}.orders

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where orderdate > (select max(orderdate) from {{ this }})

{% endif %}

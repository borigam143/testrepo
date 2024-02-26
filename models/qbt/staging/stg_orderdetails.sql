{{ config(materialized='incremental', unique_key=['orderid','lineno'])}}

select b.* from
{{ ref("stg_orders") }} a
--QBT.RAW.orders A 
inner join {{env_var('DBT_SOURCEDB','QBT')}}.{{env_var('DBT_SOURCESCHEMA','RAW')}}.orderdetails b
on a.productid=b.orderid

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where a.orderdate >= (select max(orderdate) from {{ ref("stg_orders") }})

{% endif %}

{{ config(materialized='view',schema=env_var('DBT_REPORTSCHEMA','REPORTING')) }}

{% set linenos=get_order_linenos() %}
select 
orderid,
{% for lineno in linenos %}
sum(case when lineno={{lineno}} then linesalesamount1 end) as line{{lineno}}_amount,
{% endfor %}

sum(linesalesamount1) as totalsales

from {{ref("trf_orderdetails")}}
group by 1
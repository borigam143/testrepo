{{ config(materialized='view',schema='reporting') }}

{% set linenos=get_order_linenos() %}
select 
orderid,
{% for lineno in linenos %}
sum(case when lineno={{lineno}} then linesalesamount end) as line{{lineno}}_amount,
{% endfor %}

sum(linesalesamount) as totalsales

from {{ref("trf_orderdetails")}}
group by 1
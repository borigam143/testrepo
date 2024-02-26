{{config(materialized= 'view', schema= 'salesmart')}}

{% set minorderdate=get_min_orderdate() %}
{% set maxorderdate=get_max_orderdate() %}

{{dbt_date.get_date_dimension(minorderdate,maxorderdate)}}
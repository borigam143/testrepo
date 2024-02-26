{% macro get_order_linenos() -%}

{% set distinct_linenos_query %}
select distinct
lineno
from {{ ref("trf_orderdetails") }}
order by 1
{% endset %}


{% set results = run_query(distinct_linenos_query) %}

{% if execute %}
{% set results_list=results.columns[0].values() %}
{% else %}
{% set results_list=[] %}
{% endif %}

{{ return(results_list) }}

{%- endmacro %}
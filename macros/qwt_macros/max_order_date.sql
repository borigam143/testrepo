{% macro get_max_orderdate() -%}

{% set maxorderdate %}
select max(orderdate)::date
from {{ ref("trf_orders") }}

{% endset %}


{% set results = run_query(maxorderdate) %}

{% if execute %}
{% set results_list=results.columns[0][0] %}
{% else %}
{% set results_list=[] %}
{% endif %}

{{ return(results_list) }}

{%- endmacro %}
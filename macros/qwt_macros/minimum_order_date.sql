{% macro get_min_orderdate() -%}

{% set minorderdate %}
select min(orderdate)::date
from {{ ref("trf_orders") }}
{% endset %}


{% set results = run_query(minorderdate) %}

{% if execute %}
{% set results_list=results.columns[0][0] %}
{% else %}
{% set results_list=[] %}
{% endif %}

{{ return(results_list) }}

{%- endmacro %}
{% test range(model,column_name) %}

with validation as (
    select {{ column_name }} as valid_field
    from {{ model }}
    
),

validation_errors as (
 select valid_field from validation
 where valid_field >= 20000
)
select * from validation_errors
{% endtest %}


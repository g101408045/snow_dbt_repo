WITH CTE1 AS (
    select x.*, y.value from {{source('source_is_snowflake','currency_sales')}} x
    left join {{source('source_is_snowflake','currency_value')}} y on x.currency = y.currency
)

select * exclude(value),
{%- set column_names = adapter.get_columns_in_relation(source('source_is_snowflake','currency_sales')) -%}
{%- for column_name in column_names -%}
{% if loop.index > 1 %}
{%- set column_value = column_name.column -%}
{{currecy_change(column_name.column,'value')}} as {{column_value}}_in_rupees {%- if not loop.last -%} , {% endif %}
{%- endif -%}
{% endfor %}
from CTE1




select * from {{source('source_is_snowflake', 'snow_first_table')}}

-- 
{% set person_name = dbt_utils.get_column_values(table=source('source_is_snowflake', 'snow_first_table'), column='NAME') %}
{%- for name in person_name -%}
{%- if name.lower().find('g') != -1 -%}
{{name}}
{% endif %}
{%- endfor -%}



{% set all_columns = adapter.get_columns_in_relation(source('source_is_snowflake', 'snow_first_table')) %}
{%- for column in all_columns -%}
  {{column.column}}
{% endfor %}

{% set all_columns = adapter.get_columns_in_relation(source('source_is_snowflake', 'snow_first_table')) %}
  {{all_columns}}
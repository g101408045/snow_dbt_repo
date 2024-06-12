select * from {{source("source_is_snowflake", "payments")}}

-- normal sql statement
select
sum(case when payment_mode = 'UPI' then sales end) as upi_sales
,sum(case when payment_mode = 'CASH' then sales end) as cash_sales
,sum(case when payment_mode = 'VOUCHER' then sales end) as voucher_sales
from {{source("source_is_snowflake", "payments")}}

--hardcoding column values
-- {% set all_mode = ['UPI', 'CASH', 'VOUCHER'] %}

--using jinja and macros
{% set all_mode = dbt_utils.get_column_values(table=source('source_is_snowflake', 'payments'), column='payment_mode') %}
select
{%- for modes in all_mode %}
sum(case when payment_mode = '{{modes}}' then sales end) as {{modes}}_sales,
{%- endfor %}
from {{source("source_is_snowflake", "payments")}}

--using jinja and macros
{% set all_mode = dbt_utils.get_column_values(table=source('source_is_snowflake', 'payments'), column='payment_mode') %}
select
{%- for modes in all_mode %}
sum(case when payment_mode = '{{modes}}' then sales end) as {{modes}}_sales {%- if not loop.last -%} , {% endif %}
{%- endfor %}
from {{source("source_is_snowflake", "payments")}}

--using jinja and macros
{% set all_mode = dbt_utils.get_column_values(table=source('source_is_snowflake', 'payments'), column='payment_mode') %}
select
{%- for modes in all_mode %}
{%- if loop.index > 1 -%} , {% endif %}
sum(case when payment_mode = '{{modes}}' then sales end) as {{modes | lower}}_sales
{%- endfor %}
from {{source("source_is_snowflake", "payments")}}
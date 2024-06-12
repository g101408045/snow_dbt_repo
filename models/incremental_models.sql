{{config(
    materialized = 'incremental',
    unique_key = ['product', 'date_added']
    )}}

select * from {{source("source_is_snowflake", 'dim_sales')}} new
{% if is_incremental() %}
where
new.date_added >= (select max(date_added) from {{this}})
{% endif %}

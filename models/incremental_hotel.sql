{{config(
    materialized = 'incremental',
    unique_key = ['hotel']
    )}}

select * from {{source("source_is_snowflake", 'hotel_for_incremental')}} new
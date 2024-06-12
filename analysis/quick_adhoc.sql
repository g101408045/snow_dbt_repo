select * from {{ source("source_is_snowflake", "snow_first_table") }}

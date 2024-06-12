
select *, '{{invocation_id}}' as invocation_id from {{source('source_is_snowflake', 'snow_first_table')}}
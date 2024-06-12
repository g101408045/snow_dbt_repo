{% snapshot first_scd %}

-- check strategy
{{
    config(
        target_schema = 'snaps_schema',
        strategy = 'check',
        unique_key = 'id',
        check_cols = ['first_name', 'last_name']

    )
}}

select * from {{source('source_is_snowflake', 'scd_table')}}

{% endsnapshot %}

-- updated_at strategy {{ config(target_schema = 'snaps_schema',strategy = 'timestamp',unique_key = 'id',updated_at = 'updated_at')}}

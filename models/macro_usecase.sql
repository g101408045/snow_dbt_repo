select *, 
{{age_addition('Age', 'Age')}} as new_age 
from {{source("source_is_snowflake", "snow_first_table")}}
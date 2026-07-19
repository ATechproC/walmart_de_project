{% set columns = [
    "store_id",
    "store_name",
    "store_city",
    "store_province",
    "store_country",
    "store_created_timestamp",
    "store_updated_timestamp",
    "store_is_active"
] %}

SELECT 
    {% for col in columns %}
        {{ col }}{% if not loop.last %}, {% endif %}
    {% endfor %}
FROM 
    {{ ref('obt_b') }}
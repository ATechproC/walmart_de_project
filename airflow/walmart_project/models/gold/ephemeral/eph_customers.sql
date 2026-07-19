{% set columns = [
    "customer_id",
    "customer_first_name",
    "customer_last_name",
    "customer_email",
    "customer_phone",
    "customer_city",
    "customer_province",
    "customer_country",
    "customer_created_timestamp",
    "customer_updated_timestamp",
    "customer_is_active"
] %}

SELECT 
    {% for col in columns %}
        {{ col }}{% if not loop.last %}, {% endif %}
    {% endfor %}
FROM 
    {{ ref('obt_b') }}